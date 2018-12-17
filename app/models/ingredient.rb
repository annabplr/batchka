class Ingredient < ApplicationRecord
  belongs_to :plat
  has_many :todos
end
