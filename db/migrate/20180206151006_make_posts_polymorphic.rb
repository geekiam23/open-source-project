class MakePostsPolymorphic < ActiveRecord::Migration[5.0]
  class Post < ApplicationRecord #avoid errors with future validation
    belongs_to :content, polymorphic: true
  end

  class TextPost < ApplicationRecord; end #avoid errors with future validations
    def change
      change_table(:posts) do |t| #adding additional columns to our database
        t.string :content_type
        t.integer :content_id
        t.index [:content_type, :content_id]
      end


      reversible do |dir| #allows us direction for our migration and allows up to go from post to text_post and vice versa

        Post.reset_column_information #remove cache
        Post.find_each do |post| #update past post to correct content type.
          dir.up do
            text_post = TextPost.create(body: post.body)
            post.update(content_id: text_post.id, content_type: "TextPost")
          end
          dir.down do #downgrades text_post to post
            post.update(body: post.content.body)
            post.content.destroy
          end
        end

      end
      remove_column :posts, :body, :string #removes the existing body column
  end
end
