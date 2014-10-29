class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id, :null => false
      t.integer :company_id, :null => false
      t.float :percent_swing, :null => false

      t.timestamps
    end
  end
end
