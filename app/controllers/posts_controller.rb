class PostsController < ApplicationController
  def create
    post = current_user.posts.create(posts_params)
    redirect_to :root, redirect_options_for(post)
  end

  private

  def posts_params
    params.require(:post).permit(:body)
  end

  def redirect_options_for(post)
    if post.persisted?
      { notice: "Post successfully created" }
    else
      { alert: "Sorry, post was not successful!" }
    end
  end
end
