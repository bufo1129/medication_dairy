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
  validates :number_of_tablets,   presence: true, numericality: true
  validates :individual_id,       presence: true
  validates :give_liquid,         presence: true, numericality: true
  validates :weight,              presence: true, numericality: true
  validates :several_days,        presence: true, numericality: true
  validates :condition,           presence: true, length:{maximum:30}

  #投薬のステータス
  enum medication_status: { give: true, not_give: false }

  #投薬記録お気に入り
  def favorited_by?(store)
     favorites.exists?(store_id: store.id)
  end

  #登録日順の並べ替え
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}

  # index並べ替え用メソッド
  def self.filtered_medications(params)
    medications = all
    # 個体の詳細からその個体の投薬一覧へ+並べ替え
    if params[:individual_id].present?
      medications = medications.where(individual_id: params[:individual_id])
    #店舗の詳細からその店舗の投薬一覧へ+並べ替え
    elsif params[:each_store_id].present?
      medications = medications.where(store_id: params[:each_store_id])
    end
    #投薬一覧並べ替え
    medications = medications.latest if params[:latest]
    medications = medications.old if params[:old]

    medications.order(created_at: :desc).page(params[:page]).per(8)
  end

end
