class Book < ApplicationRecord


  belongs_to :user
  has_many :favorites, dependent: :destroy
  # 本の投稿にはたくさんのいいねをいろんな人からあげれるようにするためにhasmanyで複数形
  # bookの投稿が消えたときはそのいいねもﾃﾞｰﾀﾍﾞｰｽから消えるようにdestroyを付ける。

  with_options presence: true do
    validates :title
    validates :body, length: { maximum: 200 }
  end


end
