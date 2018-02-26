module PostHelper
  def post_form_for(content_type)
    form_for(Post.new, url: content_type.new) do |form|
      form.fields_for(:content) { |content_form| yield(content_form) } +
      form.submit("Post!")
    end
  end

  def like_button(post)
    if current_user.liked?(post)
      link_to "Unlike", unlike_post_path(post), method: :delete
    else
      link_to "Like", like_post_path(post), method: :post
    end
  end

  def autolink(text)
    text.
      gsub(/@\w+/) { |mention| link_to mention, user_path(mention[1..-1])}.
      gsub(/#\w+/) { |hashtag| link_to hashtag, url: search_path(hashtag[1..-1])}.
      html_safe
  end
end
