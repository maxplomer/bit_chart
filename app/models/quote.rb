class Quote < ActiveRecord::Base

  belongs_to(
    :company,
    class_name: "Company",
    foreign_key: :company_id
  )



  def self.update_quotes
    companies = Company.all;

    companies.each do |company|
      company_id = company.id
      stock = StockQuote::Stock.quote(company.symbol)
      price = stock.ask_realtime
      Quote.create(company_id: company_id, price: price)
    end
  end

end
