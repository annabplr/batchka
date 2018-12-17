class Day < ApplicationRecord
  belongs_to :menus
  has_many :repas
  has_many :plats, through: :repas
  has_many :ingredients, through: :plats
  has_many :todos, through: :ingredients
end
