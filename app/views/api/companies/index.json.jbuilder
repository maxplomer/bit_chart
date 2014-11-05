json.array!(@companies) do |company|
  json.id company.id
  json.name company.name
  json.symbol company.symbol
  json.price company.quotes.last.price
  json.change company.quotes.last.change
end

