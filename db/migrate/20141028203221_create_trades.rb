class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :user_id, :null => false
      t.integer :company_id, :null => false
      t.integer :num_shares, :null => false

      t.timestamps
    end
  end
end
