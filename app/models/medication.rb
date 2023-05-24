class Medication < ApplicationRecord

  has_one_attached :image

  belongs_to  :individual
  belongs_to  :store,         optional: true
  has_many    :dairies,       dependent: :destroy
  has_many    :comments,      dependent: :destroy
  has_many    :favorites,     dependent: :destroy

  #薬の種類中間
  has_many    :medicine_records
  has_many    :medicines, through: :medicine_records
  #投薬回数中間
  has_many    :medicine_records
  has_many    :number_of_times, through: :medicine_records

  accepts_nested_attributes_for :medicine_records, allow_destroy: true

  validates :dosing_start_date,   presence: true
  validates :dosing_end_date,     presence: true
  validates :medication_status,   presence: true
  validates :liquid_amount,       presence: true
  validates :number_of_tablets,   presence: true
  validates :individual_id,       presence: true
  validates :weight,              presence: true
  validates :several_days,        presence: true
  validates :condition,           presence: true, length:{maximum:30}

  #投薬のステータス
  enum medication_status: { give: true, not_give: false }

  # 日報の登録日順の並べ替え
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}

  #お気に入り
  def favorited?(store)
     favorites.where(store_id: store.id).exists?
  end

end
