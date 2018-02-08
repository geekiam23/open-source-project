module PostHelper
  def avatar(user)
    email_digest = Digest::MD5.hexdigest user.email
    gravatar_url = "//www.gravatar.com/avatar/#{email_digest}"
    image_tag gravatar_url 
  end

  def like_button(post)
    if current_user.liked?(post)
      link_to "Unlike", unlike_post_path(post), method: :delete
    else
      link_to "Like", like_post_path(post), method: :post
    end
  end
end
