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
