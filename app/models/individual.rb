class Individual < ApplicationRecord

  has_one_attached :image

  belongs_to :store
  belongs_to :seeds
  
  # belongs_to :animal_species#消す


end
