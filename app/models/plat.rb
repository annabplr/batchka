class Plat < ApplicationRecord
  belongs_to :repa
  has_many :ingredients
  has_many :todos, through: :ingredients
  accepts_nested_attributes_for :ingredients
end
