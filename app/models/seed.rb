class Seed < ApplicationRecord

  has_many :individuals
  has_many :medications
  
  has_many    :seed_records
  has_many    :medications, through: :seed_record

  validates :name, presence: true

end
