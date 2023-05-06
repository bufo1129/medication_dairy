class Medication < ApplicationRecord

  has_one_attached :image

  belongs_to :medicine
  belongs_to :seed
  belongs_to :individual
  belongs_to :store
  has_many :dairies, dependent: :destroy

  #投薬のステータス
  enum medication_status: { give: true, not_give: false }
  enum dosing_times: { sid: 0, bid: 1, tid: 3 }

  #投薬計算



end
