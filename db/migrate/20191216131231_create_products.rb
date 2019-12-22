class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true 
      t.references :category, foreign_key: true, null: false, index: true 
      t.text :description
      t.decimal :price
      t.integer :make

      t.timestamps
    end
  end
end
