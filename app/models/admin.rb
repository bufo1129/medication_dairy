class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @admin = Admin.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @admin = Admin.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @admin = Admin.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @admin = Admin.where("name LIKE?","%#{word}%")
    else
      @admin = Admin.all
    end
  end

end
