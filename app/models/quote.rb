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
  
end
