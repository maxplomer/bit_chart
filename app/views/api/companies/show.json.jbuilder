json.id @company.id
json.name @company.name
json.symbol @company.symbol
json.price @company.quotes.last.price
json.change @company.quotes.last.change
json.price_graph_data_x_axis @price_graph_data_hash.keys.reverse
json.price_graph_data_y_axis @price_graph_data_hash.values.reverse

