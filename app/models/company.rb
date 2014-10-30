class Company < ActiveRecord::Base

  has_many(
    :quotes,
    class_name: "Quote",
    foreign_key: :company_id,
    dependent: :destroy
  )
  
  def find_price_from_day(time)
    self.quotes.each do |quote|
    	qtime = quote.created_at.time
        if qtime.day == time.day && qtime.month == time.month && qtime.year == time.year
          return quote.price
        end
    end

    return nil
  end

  def price_graph_data_hash
    data = {} 

    self.quotes.each do |quote| 
      data[quote.created_at.time] = quote.price 
    end 

    return data
  end

end
