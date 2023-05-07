class Individual < ApplicationRecord

  has_one_attached :image

  belongs_to :store, optional: true
  belongs_to :seed
  belongs_to :medication, optional: true

end
