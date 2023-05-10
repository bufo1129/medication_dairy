class Seed < ApplicationRecord

  has_many :individuals
  has_many :medications

  validates :name, presence: true

end
