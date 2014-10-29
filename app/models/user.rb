class User < ActiveRecord::Base
  attr_reader :password
  validates :password_digest, :presence => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true

  before_validation :ensure_session_token

  has_many(
    :trades,
    class_name: "Trade",
    foreign_key: :user_id,
    dependent: :destroy
  )

  has_many(
    :recent_quotes,
    class_name: "RecentQuote",
    foreign_key: :user_id,
    dependent: :destroy
  )

  has_many(
    :notifications,
    class_name: "Notification",
    foreign_key: :user_id,
    dependent: :destroy
  )
   
  def notification_value(company_id)
    notification = self.notifications.find_by_company_id(company_id)
    if notification.nil?
      0
    else
      notification.percent_swing
    end
  end

  def portfolio
    result = Hash.new(0)
    self.trades.each do |trade|
      result[trade.company_id] += trade.num_shares
    end     

    result.keys.each do |key|
      if result[key] == 0
        result.delete(key)
      end
    end

    result
  end

  # when calc profit/ percent
  # don't use portfolio table, use transaction history
  #do algorithm to temp add closing positions then use 
  #equations for profit/percent 

  def profit
    temp_trades = get_temp_trades

    result = 0
    temp_trades.each do |trade|
      result -= trade.num_shares * trade.price
    end

    result
  end

  def percent_gain
    temp_trades = get_temp_trades

    numer = 0
    denom = 0

    temp_trades.each do |trade|
      value = trade.num_shares * trade.price

      if trade.num_shares < 0
        numer -= value
      else
        denom += value
      end
    end
    
    if denom == 0
      0
    else
      truncate(((numer / denom) - 1) * 100)
    end
  end

  #auth

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    user.try(:is_password?, password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def get_temp_trades
    #copy trades 
    result = []
    self.trades.dup.each { |trade| result.push(trade) }

    # temporarily close all positions
    self.portfolio.keys.each do |company_id|
      result.push(
        Trade.new(
          user_id: self.id,
          company_id: company_id, 
          num_shares: -self.portfolio[company_id], 
          price: Company.find(company_id).quotes.last.price
        )
      )
    end

    result
  end

  def truncate(x)
    (x * 100).floor / 100.0
  end

end
