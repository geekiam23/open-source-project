class PostsController < ApplicationController
  def create
    post = current_user.posts.create(posts_params)
    redirect_to :root, redirect_options_for(post)
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def posts_params
    { content: content_from_params }
  end

  def content_from_params
    case params[:post][:content_type]
    when "Text Post" then TextPost.new(text_post_content_params)
    when "Pic Post" then PicPost.new(pic_post_content_params)
    end
  end

  def text_post_content_params
    params.require(:post).require(:content).permit(:body)
  end

  def pic_post_content_params
    params.require(:post).require(:content).permit(:image)
  end

  def redirect_options_for(post)
    if post.persisted?
      { notice: "Post successfully created" }
    else
      { alert: "Sorry, post was not successful!" }
    end
  end
end
