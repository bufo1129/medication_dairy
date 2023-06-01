class Comment < ApplicationRecord
  belongs_to  :store,       optional: true
  belongs_to  :medication,  optional: true
  has_many    :sees,        dependent: :destroy
  belongs_to  :admin,       optional: true
  has_many    :admin_sees,  dependent: :destroy　#管理者コメントいいね機能

  validates :comment,     presence: true, length:{maximum:140}

  #店舗コメントいいね機能
  def comment_saw?(store)
     sees.exists?(store_id: store.id)
  end
  #管理者コメントいいね機能
  def admin_comment_saw?(admin)
     admin_sees.exists?(admin_id: admin.id)
  end

end
