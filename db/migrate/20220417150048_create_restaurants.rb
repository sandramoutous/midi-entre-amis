class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :note
      t.boolean :favorite, default: false
      t.references :category
      t.references :cuisine
    end
  end
end
