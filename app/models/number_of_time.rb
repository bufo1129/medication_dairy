class NumberOfTime < ApplicationRecord

  has_many :medicine_records
  has_many :medications, through: :medicine_record

  validates :name,          presence: true
  validates :dosing_times,  presence: true

end
