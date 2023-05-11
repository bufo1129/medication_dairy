class Medication < ApplicationRecord

  has_one_attached :image

  belongs_to  :individual
  belongs_to  :store, optional: true
  has_many    :dairies, dependent: :destroy

  has_many    :medicine_records
  has_many    :medicines, through: :medicine_record

  accepts_nested_attributes_for :medicine_records
  #投薬のステータス
  enum medication_status: { give: true, not_give: false }

  validates :individual_id,       presence: true
  
  # ↓日報の登録日順の並べ替え
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}

end
