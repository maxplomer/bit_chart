class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :company_id, :null => false
      t.float :price, :null => false 

      t.timestamps
    end
  end
end
