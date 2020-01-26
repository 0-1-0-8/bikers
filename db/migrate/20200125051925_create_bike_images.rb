class CreateBikeImages < ActiveRecord::Migration[5.2]
  def change
    create_table :bike_images do |t|
      t.integer :bike_id
      t.string :image_id

      t.timestamps
    end
  end
end
