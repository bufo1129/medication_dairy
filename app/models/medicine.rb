class Medicine < ApplicationRecord

  has_many :medicine_records
  has_many :medications, through: :medicine_record

end
