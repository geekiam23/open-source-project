class CreateMeetingPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_posts do |t|
      t.string :title
      t.text :body
      t.datetime :date

      t.timestamps
    end
  end
end
