class Favorite < ApplicationRecord

  belongs_to :store
  belongs_to :medication

  validates_uniqueness_of :medication_id, scope: :store_id

end
