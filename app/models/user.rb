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
end
