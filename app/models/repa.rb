class Repa < ApplicationRecord
  belongs_to :day
  has_many :plats
  has_many :ingredients, through: :plats
  has_many :todos, through: :ingredients
end
