class NumberOfTime < ApplicationRecord

  has_many :medications

  validates :name,          presence: true
  validates :dosing_times,  presence: true

end
