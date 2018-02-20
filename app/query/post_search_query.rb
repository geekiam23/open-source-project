class PostSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    matching_posts_for_text_posts.
      or(matching_posts_for_pic_posts)
  end

  private

  attr_reader :term


  def matching_posts_for_text_posts
    Post.where(content_type: "TextPost", content_id: matching_text_posts.select(:id))
  end

  def matching_text_posts
    TextPost.where("body Like ?", "%#{term}%")
  end

  def matching_posts_for_pic_posts
    Post.where(content_type: "PicPost", content_id: matching_pic_posts.select(:id))
  end

  def matching_pic_posts
    PicPost.where("image_file_name Like ?", "%#{term}%")
  end
end
