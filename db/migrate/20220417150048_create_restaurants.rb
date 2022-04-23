class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :image
      t.text :description
      t.references :category
      t.references :cuisine
      t.timestamps
    end
  end
end
