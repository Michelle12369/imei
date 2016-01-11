class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :p_id
      t.string :p_name
      t.integer :number_sold
      t.integer :number_bought
      t.date :valid_date
      t.integer :temp

      t.timestamps null: false
    end
  end
end
