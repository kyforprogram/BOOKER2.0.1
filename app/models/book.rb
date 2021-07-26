class Book < ApplicationRecord


    belongs_to :user
    has_many :post_comments, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :body, length: { maximum: 200 }
  end


end
