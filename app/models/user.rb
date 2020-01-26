class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bikes, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :profile_image
  has_many :favorites, dependent: :destroy
  has_many :favorite_bikes, through: :favorites, source: :favorite
  has_many :followed_follows, foreign_key: "follower_id", class_name: "Follow",  dependent: :destroy
  has_many :followed, through: :followed_follows

	def followed?(user)
		followed_follows.find_by(followed_id: user.id)
	end

	def follow(user)
		followed_follows.create!(followed_id: user.id)
	end

	def unfollow(user)
		followed_follows.find_by(followed_id: user.id).destroy
	end
end
