class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.integer :user_id
      t.string :text
      t.string :image
      t.string :video
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
