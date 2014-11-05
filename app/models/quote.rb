class Quote < ActiveRecord::Base

  belongs_to(
    :company,
    class_name: "Company",
    foreign_key: :company_id
  )

  # for trading and saving stock quotes
  def self.during_day?
    now = Time.new.getutc
    if now.saturday? || now.sunday?
      return false
    end 

    #convert time to integer
    now_integer = now.hour * 60 + now.min
    open = 14 * 60 + 30                    # 2:30 pm utc (930am est)
    close = 21 * 60                       # 9pm utc  (4pm est)

    now_integer.between?(open, close)
  end

  def self.update_quotes
    return unless self.during_day?
    
    companies = Company.all;

    companies.each do |company|
      company_id = company.id

      price = MarketBeat.last_trade_real_time(company.symbol)
      change = MarketBeat.change_real_time(company.symbol)
      unless price.nil?
        Quote.create(company_id: company_id, price: price, change: change)
      end
    end

    Notification.generate_messages
  end

  def percent_change
    price_now = self.price 
    price_prev = price_now - self.change 
    return truncate( ((price_now / price_prev) - 1) * 100 )
  end

  private

  def truncate(x)
    (x * 100).floor / 100.0
  end
  
end
