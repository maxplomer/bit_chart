class CreateRecentQuotes < ActiveRecord::Migration
  def change
    create_table :recent_quotes do |t|
      t.integer :user_id, :null => false
      t.integer :company_id, :null => false

      t.timestamps
    end
  end
end
