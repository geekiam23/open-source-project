class CreatePicPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :pic_posts do |t|
      t.attachment :image, null: false

      t.timestamps
    end
  end
end
