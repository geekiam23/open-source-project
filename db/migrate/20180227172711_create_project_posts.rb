class CreateProjectPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :project_posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :link
      t.string :repo

      t.timestamps
    end
  end
end
