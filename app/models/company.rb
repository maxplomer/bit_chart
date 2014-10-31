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

    #only want graph to erase at 9:30am when new quote is pulled
    new_quote_today = self.quotes.last.created_at.time.today?

    if new_quote_today

      self.quotes.each do |quote| 
        data[quote.created_at.time] = quote.price if quote.created_at.time.today?
      end
      
    else

      self.quotes.each do |quote| 
        data[quote.created_at.time] = quote.price if (quote.created_at.time + 1.day).today?
      end 

    end
    
    return data
  end

end
