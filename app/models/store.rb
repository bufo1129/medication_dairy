class Store < ApplicationRecord

  has_many :individuals,  dependent: :destroy
  has_many :dairies,      dependent: :destroy
  has_many :medications,  dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ここから　住所自動入力
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  # ↑ここまで　住所自動入力

end
