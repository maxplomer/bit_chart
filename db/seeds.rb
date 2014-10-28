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



# restart db 
# rake db:drop db:create:all db:migrate db:seed

