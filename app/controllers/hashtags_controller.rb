class HashtagsController < ApplicationController
  def show
    @search = Search.new(term: hashtag)
    @results = PostSearchQuery.new(term: "##{@hashtag}").to_relation
  end

  private
  
  def hashtag
    params[:id]
  end
end
