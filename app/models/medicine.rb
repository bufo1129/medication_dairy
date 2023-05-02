class Medicine < ApplicationRecord

  has_many :medications, dependent: :destroy

end
