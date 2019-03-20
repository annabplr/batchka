class Menu < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :repas, through: :days
  has_many :plats, through: :repas
  has_many :ingredients, through: :plats

  validates :startdate, presence: true
  validate :startdate_validation

  def startdate_validation
    if startdate.present? && startdate < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

end
