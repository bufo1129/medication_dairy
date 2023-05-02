class AnimalSpecy < ApplicationRecord

  has_many :individuals, dependent: :destroy
  has_many :medications, dependent: :destroy

end
