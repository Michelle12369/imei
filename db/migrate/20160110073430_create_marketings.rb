class CreateMarketings < ActiveRecord::Migration
  def change
    create_table :marketings do |t|
      t.string :p_id
      t.string :p_name
      t.integer :r_inventory
      t.float :price
      t.float :price_origin
      t.float :increase
      t.float :profit
      t.date :valid_date
      t.string :retail_id

      t.timestamps null: false
    end
  end
end
