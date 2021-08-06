class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # bookと同様にuserが消えたらいいねも、きえるようにする
  has_many :book_comments, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followings, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # def already_favorited?(book)
  #   self.favorites.exists?(book_id: book.id)
  #   # trueならいいねをはずすfalseならいいねを付けます
  # end
  def already_favorited?(book_id)
  favorites.where(book_id: book_id).exists?
  end


  def follow(user_id)
    active_relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    active_relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end

  attachment :profile_image
  # 画像をに必要な記述

  validates :name, presence: true
  validates :name,length: { minimum: 2, maximum: 20 } ,uniqueness: true
  validates :introduction,length: { maximum: 50 }

end
