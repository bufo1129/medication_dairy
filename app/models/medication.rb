class Medication < ApplicationRecord

  has_one_attached :image

  belongs_to :medicine
  belongs_to :seed
  belongs_to :individual
  belongs_to :store

  # belongs_to :animal_specy#消す



end
