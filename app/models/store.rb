class Store < ApplicationRecord

  has_many :individuals,  dependent: :destroy
  has_many :dairies,      dependent: :destroy
  has_many :medications,  dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
