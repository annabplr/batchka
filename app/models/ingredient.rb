class Ingredient < ApplicationRecord
  belongs_to :plat
  has_many :todos

  validates :instock, inclusion: [true, false]
end
