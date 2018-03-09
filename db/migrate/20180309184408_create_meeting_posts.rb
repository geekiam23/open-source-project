class CreateMeetingPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.date :date, null: false
      t.time :time, null: false

      t.timestamps
    end
  end
end
