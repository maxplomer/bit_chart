class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, :null => false
      t.string :symbol, :null => false
      t.timestamps
    end
  end
end
