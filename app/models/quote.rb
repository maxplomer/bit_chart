class Quote < ActiveRecord::Base

  belongs_to(
    :company,
    class_name: "Company",
    foreign_key: :company_id
  )

  def self.update_quotes
    return unless during_day?
    
    companies = Company.all;

    companies.each do |company|
      company_id = company.id

      stock = StockQuote::Stock.quote(company.symbol)
      price = stock.ask
      change = stock.change
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

  # for trading and saving stock quotes
  def during_day?
    now = Time.new
    if now.saturday? || now.sunday?
      return false
    end 

    #convert time to integer
    now_integer = now.hour * 60 + now.min
    open = 9 * 60 + 30                    # 9:30 am
    close = 16 * 60                       # 4pm

    now_integer.between?(open, close)
  end
  
end
