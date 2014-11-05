json.id @user.id
json.name @user.name
json.email @user.email
json.profit @user.profit
json.percent_gain @user.percent_gain

json.portfolio_keys do
  json.array! @user.portfolio.keys
end

json.portfolio_values do
  json.array! @user.portfolio.values
end

json.trades_company_id do
  json.array! @trades_company_id
end

json.trades_num_shares do
  json.array! @trades_num_shares
end

json.trades_price do
  json.array! @trades_price
end

json.profit_graph_data_x_axis @user.profit_graph_data_hash.keys
json.profit_graph_data_y_axis @user.profit_graph_data_hash.values

notification_values = [];
@user.portfolio.keys.each do |company_id|
  notification_values.push(@user.notification_value(company_id))
end

json.notification_values do
  json.array! notification_values
end
