class Company < ActiveRecord::Base

  has_many(
    :quotes,
    class_name: "Quote",
    foreign_key: :company_id,
    dependent: :destroy
  )
  
  def find_price_from_day(time)
    return nil if self.quotes.empty?

    #this will grab a quote from beginning of day if exists
    self.quotes.each do |quote|
    	qtime = quote.created_at.time
        if qtime.day == time.day && qtime.month == time.month && qtime.year == time.year
          return quote.price
        end
    end

    #if its a saturday, we want to return the last quote of the day
    while true
      time = time - 1.day
      self.quotes.reverse.each do |quote|
        qtime = quote.created_at.time
          if qtime.day == time.day && qtime.month == time.month && qtime.year == time.year
            return quote.price
          end
      end
    end

  end

  def price_graph_data_hash
    data = {} 

    #only want graph to erase at 9:30am when new quote is pulled
    day_last_quote = self.quotes.last.created_at.time.day

    self.quotes.reverse.each do |quote|
      break if quote.created_at.time.day != day_last_quote

      data[quote.created_at.time] = quote.price
    end
    
    return data
  end

end
