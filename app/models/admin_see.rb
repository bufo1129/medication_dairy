class AdminSee < ApplicationRecord
  belongs_to :comment
  belongs_to :admin
  validates_uniqueness_of :comment_id, scope: :admin_id
end
