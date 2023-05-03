class Medication < ApplicationRecord

  has_one_attached :image

  belongs_to :medicine
  belongs_to :seed
  belongs_to :individual
  belongs_to :store
  has_many :dairies, dependent: :destroy

end
