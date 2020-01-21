class AddFavoritesCountToBikes < ActiveRecord::Migration[5.2]
  def change
    add_column :bikes, :favorites_count, :integer
  end
end
