# This app does some intense number crunching and currently is only stable with about a few months worth of data.


Log into heroku console

    heroku run rails console

Get first quote currently in database

    Quote.first
    => #<Quote id: 2514294, company_id: 1094, price: 67.74, change: -0.12, created_at: "2015-09-29 16:48:59", updated_at: "2015-09-29 16:48:59">

    Quote.find(2885360)
    => #<Quote id: 2885360, company_id: 1013, price: 40.96, change: 0.42, created_at: "2016-05-05 20:48:23", updated_at: "2016-05-05 20:48:23">


I manually looked up the id's of the quote i would like to delete ( 2514294 -> 2885360 )

    2514294.upto(2885360) do |i|
      puts i
      Quote.find(i).destroy rescue nil
    end


Then i need to move up the trades to recent dates, and change the price of those those to reflect the stock price at that time

Lets check out the dates of the trades

    > Trade.all.each { |trade| p trade.created_at }
    Sat, 14 Nov 2015 16:28:12 UTC +00:00
    Sun, 15 Nov 2015 15:15:42 UTC +00:00
    Wed, 18 Nov 2015 15:00:17 UTC +00:00
    Wed, 18 Nov 2015 15:01:05 UTC +00:00
    Wed, 18 Nov 2015 15:03:12 UTC +00:00
    Wed, 18 Nov 2015 15:03:19 UTC +00:00
    Wed, 18 Nov 2015 15:03:26 UTC +00:00
    Fri, 20 Nov 2015 14:49:37 UTC +00:00
    Sun, 22 Nov 2015 20:38:05 UTC +00:00

Need to add 6 months to trades


Trade.all.each do |trade|
   trade.created_at = trade.created_at + 6.months
   trade.save
end


# Getting error 

    ActionView::Template::Error (undefined method `price' for nil:NilClass):
        2:   json.id company.id
        3:   json.name company.name
        4:   json.symbol company.symbol
        5:   json.price company.quotes.last.price
        6:   json.change company.quotes.last.change
        7: end

Some companies may have gone out of business !


    Company.all.each do |company|
      puts company.id
      puts company.quotes.last.price
    end

Delete each company that fails in this loop

For example I can do delete ACE

    Company.find(1007).destroy

For now until I totally reset database and debug app, need to delete every company with id after 1014 (something is happening where maxing out yahoo finance API)

    1014.upto(1356).each do |i|
        Company.find(i).destroy rescue nil
    end


