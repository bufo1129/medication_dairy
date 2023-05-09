class Medication < ApplicationRecord

  has_one_attached :image

  belongs_to  :seed
  belongs_to  :individual
  belongs_to  :store, optional: true
  has_many    :dairies, dependent: :destroy
  has_many    :medicine_records
  has_many    :medicines, through: :medicine_record
  has_many    :individuals
  belongs_to  :number_of_time

  #投薬のステータス
  enum medication_status: { give: true, not_give: false }

end
