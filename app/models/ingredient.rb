class Ingredient < ApplicationRecord
  belongs_to :plat
  has_many :todos, dependent: :destroy

  validates :instock, inclusion: [true, false], default: false
end
