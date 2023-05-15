class MedicineRecord < ApplicationRecord

    belongs_to :medicine
    belongs_to :medication
    belongs_to :number_of_time

end
