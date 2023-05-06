class Medication < ApplicationRecord

  has_one_attached :image

  belongs_to :seed
  belongs_to :individual
  belongs_to :store
  has_many :dairies, dependent: :destroy
  
  has_many :medicine_records
  has_many :medicines, through: :medicine_record

  #投薬のステータス
  enum medication_status: { give: true, not_give: false }
  enum dosing_times: { sid: 1, bid: 2, tid: 3 }

  #投薬計算



end
