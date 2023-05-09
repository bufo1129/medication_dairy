class Dairy < ApplicationRecord

  belongs_to :store
  belongs_to :medication, optional: true
  belongs_to :weather

  # ↓日報の登録日順の並べ替え
  scope :latest, -> {order(created_date: :desc)}
  scope :old, -> {order(created_date: :asc)}


  # def weather?(weather)
  #   case weather.to_i
  #     when 1 then
  #       "晴れ"
  #     when 2 then
  #       "曇り"
  #     when 3 then
  #       "雨"
  #     when 4 then
  #       "曇/雨"
  #     when 5 then
  #       "豪雨"
  #     when 6 then
  #       "雪"
  #     else
  #       "？"
  #   end
  # end

end
