class Dairy < ApplicationRecord

  belongs_to :store
  belongs_to :medication, optional: true
  belongs_to :weather

  # 日報の登録日順の並べ替え
  scope :latest, -> {order(created_date: :desc)}
  scope :old, -> {order(created_date: :asc)}

  # cocoon
  has_many :dairy_items, dependent: :destroy
  accepts_nested_attributes_for :dairy_items, reject_if: :all_blank, allow_destroy: true

  validates :weather_id,        presence: true
  validates :high_temperature,  presence: true, numericality: true
  validates :low_temperature,   presence: true, numericality: true
  validates :humidity,          presence: true, numericality: true
  validates :created_date,      presence: true
  validates :title,             presence: true, length:{maximum:30}
  validates :body,              presence: true

end
