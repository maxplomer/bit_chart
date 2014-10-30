# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create(name: "Apple Inc.", symbol: "AAPL")
Company.create(name: "Tesla Motors", symbol: "TSLA")
Company.create(name: "Google", symbol: "GOOG")

User.create(name: "Max", email: "maxplomer@gmail.com", password: "123456")
User.create(name: "helloworld", email: "helloworld", password: "helloworld")


# restart db 
# rake db:drop db:create:all db:migrate db:seed

# save schedule.rb to crontab
# whenever --update-crontab




# some end of the day stock quote because now using ask and change and ask is nil after hours
#can't buy unless ask is not nil
# Quote.create(company_id: 1, price: 106.74, change: 1.63)
# Quote.create(company_id: 2, price: 242.77, change: 21.10)
# Quote.create(company_id: 3, price: 548.90, change: 8.13)


# want to create some sample trades because market is closed and can't trade after hours
# Trade.create(user_id: 1, company_id: 1, num_shares: 100, price: 95.42)
# Trade.create(user_id: 1, company_id: 2, num_shares: -100, price: 295.23)
# Trade.create(user_id: 1, company_id: 3, num_shares: 100, price: 25)
# Trade.create(user_id: 1, company_id: 3, num_shares: -100, price: 25)

# Trade.create(user_id: 2, company_id: 1, num_shares: -100, price: 95.42)
# Trade.create(user_id: 2, company_id: 2, num_shares: 100, price: 295.23)


# need some sample notification_messages
# NotificationMessage.create(
#   user_id: 1, 
#   message: "APPL triggered +4.0% alert"
# )
# NotificationMessage.create(
#   user_id: 1, 
#   message: "GOOG triggered -3.0% alert"
# )

# need to test profit graph, works best during trading day
user = User.new(name: "sennacy", email: "sennacy@catworld.gov", password: "helloworld")
user.created_at = Time.now - 2.day
user.save

trade = Trade.new(user_id: 3, company_id: 1, num_shares: 100, price: 106.0)
trade.created_at = Time.now - 2.day + 20.minutes
trade.save

quote = Quote.new(company_id: 1, price: 106.0, change: 1.63)
quote.created_at = Time.now - 2.day + 20.minutes
quote.save

quote = Quote.new(company_id: 1, price: 107.32, change: 1.63)
quote.created_at = Time.now - 1.day + 20.minutes
quote.save







