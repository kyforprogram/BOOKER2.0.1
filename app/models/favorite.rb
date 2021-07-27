class Favorite < ApplicationRecord

belongs_to :user
# 一人のユーザーに属している
belongs_to :book
# 二つとも単数形

  validates_uniqueness_of :book_id, scope: :user_id
  # １通りしかないことにする
end
