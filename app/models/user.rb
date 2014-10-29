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

# want to create a table like so
#company_id  share   
#   1         10     

# when calc profit/ percent
# don't use portfolio table, use transaction history
#do algorithm to temp add closing positions then use 
#equations for profit/percent 

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

  def profit

    #copy trades 
    temp_trades = []
    self.trades.dup.each { |trade| temp_trades.push(trade) }

    # temporarily close all positions
    self.portfolio.keys.each do |company_id|
      temp_trades.push(
        Trade.new(
          user_id: self.id,
          company_id: company_id, 
          num_shares: -self.portfolio[company_id], 
          price: Company.find(company_id).quotes.last.price
        )
      )
    end

    result = 0
    temp_trades.each do |trade|
      result -= trade.num_shares * trade.price
    end

    result
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
end
