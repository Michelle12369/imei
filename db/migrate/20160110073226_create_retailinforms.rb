class CreateRetailinforms < ActiveRecord::Migration
  def change
    create_table :retailinforms do |t|
      t.string :p_id
      t.integer :max_demand
      t.integer :min_demand
      t.integer :r_inventory
      t.integer :book_cost
      t.integer :hold_cost
      t.integer :cost
      t.integer :price
      t.float :eoq
      t.float :rop

      t.timestamps null: false
    end
  end
end
