class AddNullFalseToMeetingPosts < ActiveRecord::Migration[5.0]
  def change
    change_column_null :meeting_posts, :title, false
    change_column_null :meeting_posts, :body, false
    change_column_null :meeting_posts, :date, false
  end
end
