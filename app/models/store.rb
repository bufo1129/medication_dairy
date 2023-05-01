class Store < ApplicationRecord

  has_many :individuals, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
