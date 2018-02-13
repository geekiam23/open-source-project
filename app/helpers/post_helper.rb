module PostHelper
  def like_button(post)
    if current_user.liked?(post)
      link_to "Unlike", unlike_post_path(post), method: :delete
    else
      link_to "Like", like_post_path(post), method: :post
    end
  end

  def autolink(text)
    text.gsub(/@\w+/) { |mention| link_to mention, user_path(mention[1..-1])}.html_safe
  end
end
