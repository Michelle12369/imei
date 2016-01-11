class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :p_id
      t.string :p_name
      t.integer :p_inventory
      t.date :produce_date
      t.integer :cost
      t.integer :price
      t.string :factory

      t.timestamps null: false
    end
  end
end
