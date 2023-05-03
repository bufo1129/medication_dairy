class Dairy < ApplicationRecord

  belongs_to :store
  belongs_to :medication

  enum give_medicine: { not_give: true, give: false }

end
