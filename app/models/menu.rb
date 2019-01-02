class Menu < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :repas, through: :days
  has_many :plats, through: :repas
  has_many :ingredients, through: :plats

end
