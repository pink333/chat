class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  #liked_usersによって投稿が誰にいいねされているのかを簡単に取得できるようになります

end

