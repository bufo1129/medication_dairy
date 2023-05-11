class Individual < ApplicationRecord

  has_one_attached :image

  belongs_to :store,      optional: true
  belongs_to :seed
  has_many :medications, dependent: :destroy
  
  #投薬のステータス
  enum medication_status: { give: true, not_give: false }

  #画像
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_fill: [width, height]).processed
  end

  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @individual = Individual.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @individual = Individual.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @individual = Individual.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @individual = Individual.where("name LIKE?","%#{word}%")
    else
      @individual = Individual.all
    end
  end

end
