class Comment < ApplicationRecord
  belongs_to :store,      optional: true
  belongs_to :medication, optional: true
  
  validates :comment,     presence: true, length:{maximum:140}
end
