class Bike < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    has_many :favoriting_users, through: :favorites, source: :user
end
