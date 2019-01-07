class Plat < ApplicationRecord
  belongs_to :repa
  has_many :ingredients, dependent: :destroy
  has_many :todos, through: :ingredients
  accepts_nested_attributes_for :ingredients
end
