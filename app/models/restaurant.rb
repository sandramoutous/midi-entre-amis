class Restaurant < ApplicationRecord
  belongs_to :category
  belongs_to :cuisine
  validates :name, :address, presence: true

  def self.search(params)
    category_id = params.fetch(:category_id, nil)
    cuisine_ids = params.fetch(:cuisine_ids, nil)

    categories = category_id.present? ? category_id : Category.all.map(&:id)
    cuisines = cuisine_ids.present? ? cuisine_ids : Cuisine.all.map(&:id)

    Restaurant.where(category_id: categories).where(cuisine_id: cuisines)
  end
end