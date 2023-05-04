class Dairy < ApplicationRecord

  belongs_to :store
  belongs_to :medication, optional: true

  # enum give_medicine: { not_give: true, give: false }

  def weather?(weather)
    case weather.to_i
      when 1 then
        "晴れ"
      when 2 then
        "曇り"
      when 3 then
        "雨"
      when 4 then
        "曇/雨"
      when 5 then
        "豪雨"
      when 6 then
        "雪"
      else
        "？"
    end
  end

end
