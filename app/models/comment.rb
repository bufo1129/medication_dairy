class Comment < ApplicationRecord
  belongs_to  :store,       optional: true
  belongs_to  :medication,  optional: true
  has_many    :sees,        dependent: :destroy

  validates :comment,     presence: true, length:{maximum:140}

  #見ました(see)
  def comment_saw?(store)
     sees.exists?(store_id: store.id)
  end

end
