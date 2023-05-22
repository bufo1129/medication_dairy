class Medicine < ApplicationRecord

  has_many :medicine_records
  has_many :medications, through: :medicine_record

  validates :name,                    presence: true, uniqueness: true, length:{maximum:30}
  validates :ingredients_per_tablet,  presence: true

end
