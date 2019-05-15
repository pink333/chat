class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post  
  #userがどの投稿にいいねをしているのか簡単に取得できるようにする
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
  foreign_key: "follower_id",
  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
  foreign_key: "followed_id",
  dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  mount_uploader :picture, PictureUploader
  validates :username,uniqueness: true  
  validate :picture_size
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :validatable, password_length: 4..4

  def email_required?
    false
  end
  def email_changed?
    false
  end

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  private
   def picture_size
    picture.size > 5.megabytes
  end
  end
  

