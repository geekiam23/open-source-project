class DashboardsController < ApplicationController
  def show
    @post = Post.new
    @posts = current_user.timeline_posts
  end
end
