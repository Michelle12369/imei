class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :m_id
      t.string :m_name
      t.integer :m_cost
      t.string :supplier
      t.integer :transportation_time
      t.integer :number
      t.string :result
      t.integer :quality
      t.string :s_address
      t.integer :s_phone
      t.integer :condition

      t.timestamps null: false
    end
  end
end
