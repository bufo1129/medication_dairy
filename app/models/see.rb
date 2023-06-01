class See < ApplicationRecord
  # 投薬記録コメントのいいねモデル
  belongs_to :comment
  belongs_to :store
  validates_uniqueness_of :comment_id, scope: :store_id
end
