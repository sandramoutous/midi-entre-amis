class CreateUserRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :user_restaurants do |t|
      t.references :user
      t.references :restaurant
      t.text :comment
      t.timestamps
    end
  end
end
