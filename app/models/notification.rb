class Notification < ActiveRecord::Base

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id
  )

  def self.generate_messages
    self.all.each do |alert|
      company = Company.find(alert.company_id)
      if company.quotes.last.percent_change.abs > alert.percent_swing
      	flag = (company.quotes.last.percent_change > 0 ? "+" : "-")
      	message = "#{company.symbol} triggered #{flag}#{alert.percent_swing}% alert"
        NotificationMessage.create(user_id: alert.user_id, message: message)
        alert.destroy
      end
    end
  end

end
