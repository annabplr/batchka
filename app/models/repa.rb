class Repa < ApplicationRecord
  belongs_to :day
  has_many :plats
  has_many :ingredients, through: :plats
  has_many :todos, through: :ingredients

  def uncompleted?
    plats.where.not(name: nil).none?
  end
end
