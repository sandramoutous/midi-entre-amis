class Restaurant < ApplicationRecord
  belongs_to :category
  belongs_to :cuisine
  validates :name, :address, presence: true
end