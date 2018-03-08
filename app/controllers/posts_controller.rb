class PostsController < ApplicationController
  def create
    @post = current_user.posts.create(posts_params)
    redirect_to :root, redirect_options_for(post)
  end

  def index
    if params[:tag]
        @posts = Post.tagged_with(params[:tag])
    else
        @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def show_text
    @post = TextPost.find(params[:id])
  end

  def show_pic
    @post = PicPost.find(params[:id])
  end

  def search
    @posts = Elasticsearch::Model.search(params[:q], [PicPost, TextPost])
  end

  private

  def posts_params
    { content: content_from_params }
  end

  def content_from_params
    params[:content_type].new(content_params)
  end

  def content_params
    params.require(:post).require(:content).permit!
  end


  def redirect_options_for(post)
    if post.persisted?
      { notice: "Post successfully created" }
    else
      { alert: "Sorry, post was not successful!" }
    end
  end
end
