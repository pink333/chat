class User < ApplicationRecord
  has_many :posts, dependent: :destroy
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
  private
   def picture_size
    picture.size > 5.megabytes
  end
  end
  

