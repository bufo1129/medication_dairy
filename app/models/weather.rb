class Weather < ApplicationRecord

  has_many :dairies

  validates :name, presence: true
  validates :name, uniqueness: true

end
