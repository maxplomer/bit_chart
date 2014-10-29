class CreateNotificationMessages < ActiveRecord::Migration
  def change
    create_table :notification_messages do |t|
      t.integer :user_id, :null => false
      t.string :message, :null => false

      t.timestamps
    end
  end
end
