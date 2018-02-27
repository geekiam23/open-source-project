class CreateJobPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :link, null: false
      t.integer :salary
      t.string :location, null: false

      t.timestamps
    end
  end
end
