class Comment < ApplicationRecord
  belongs_to  :store,       optional: true
  belongs_to  :medication,  optional: true
  has_many    :sees,        dependent: :destroy
  belongs_to  :admin,       optional: true
  has_many    :admin_sees,        dependent: :destroy

  validates :comment,     presence: true, length:{maximum:140}

  #見ました機能(see)
  def comment_saw?(store)
     sees.exists?(store_id: store.id)
  end

  def admin_comment_saw?(admin)
     admin_sees.exists?(admin_id: admin.id)
  end

end
