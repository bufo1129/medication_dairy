class Seed < ApplicationRecord

  has_many :individuals
  has_many :medications

end
