class Seed < ApplicationRecord

  has_many :individuals
  validates :name, presence: true, uniqueness: true, length:{maximum:30}

end
