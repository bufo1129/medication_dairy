class Individual < ApplicationRecord

  has_one_attached :image

  belongs_to :store
  belongs_to :seed

end
