class Bike < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    has_many :favoriting_users, through: :favorites, source: :user
    has_many :bike_images
    accepts_attachments_for :bike_images, attachment: :image
    validates :text, presence: true
    validates :text, length: {maximum: 140}
    default_scope -> { order(created_at: :desc) }
end
