class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # bookと同様にuserが消えたらいいねも、きえるようにする


  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
    # trueならいいねをはずすfalseならいいねを付けます
  end

  attachment :profile_image
  # 画像に必要な記述

  validates :name, presence: true
  validates :name,length: { minimum: 2, maximum: 20 } ,uniqueness: true
  validates :introduction,length: { maximum: 50 }

end
