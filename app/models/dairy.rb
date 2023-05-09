class Dairy < ApplicationRecord

  belongs_to :store
  belongs_to :medication, optional: true
  belongs_to :weather

  # ↓日報の登録日順の並べ替え
  scope :latest, -> {order(created_date: :desc)}
  scope :old, -> {order(created_date: :asc)}


end
