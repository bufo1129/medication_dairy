class Medicine < ApplicationRecord

  has_many :medicine_records
  has_many :medications, through: :medicine_record

  validates :name,                    presence: true
  validates :ingredients_per_tablet,  presence: true
  validates :name,                    uniqueness: true

end
