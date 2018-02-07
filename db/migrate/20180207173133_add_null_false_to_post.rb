class AddNullFalseToPost < ActiveRecord::Migration[5.0]
  def change
    change_column_null :posts, :user_id, false
    change_column_null :posts, :content_type, false
    change_column_null :posts, :content_id, false
  end
end
