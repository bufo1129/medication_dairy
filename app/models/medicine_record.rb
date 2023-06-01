class MedicineRecord < ApplicationRecord
    # 投薬記録と薬、投薬記録と投薬回数の中間モデル
    belongs_to :medicine
    belongs_to :medication
    belongs_to :number_of_time

end
