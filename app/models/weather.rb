class Weather < ApplicationRecord

  has_many :dairies
  validates :name, presence: true, uniqueness: true, length:{maximum:30}

end
