class Store < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :postal_code
    validates :prefecture_code
  end

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
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).present? ? JpPrefecture::Prefecture.find(name: prefecture_name).code : 0
  end
  # ↑住所自動入力、都道府県未登録の際でも取得できるように定義

  # ゲストログイン↓
  def self.guest
    find_or_create_by!(name: 'guest' ,email: 'guest@example.com') do |store|
      store.password = SecureRandom.urlsafe_base64
      store.name = "guest"
    end
  end

end
