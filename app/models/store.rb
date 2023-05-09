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

  #↓住所自動入力
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).present? ? JpPrefecture::Prefecture.find(name: prefecture_name).code : 0
  end
  
  #↓ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com' ,postal_code: '222222' ,prefecture_code: '神奈川県') do |store|
      store.password = SecureRandom.urlsafe_base64
      store.name = "guestuser"
    end
  end
  
  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @store = Store.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @store = Store.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @store = Store.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @store = Store.where("name LIKE?","%#{word}%")
    else
      @store = Store.all
    end
  end

end
