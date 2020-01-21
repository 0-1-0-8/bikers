class Favorite < ApplicationRecord
	belongs_to :bike, counter_cache: :favorites_count
    belongs_to :user
end
