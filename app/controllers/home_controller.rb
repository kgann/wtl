class HomeController < ApplicationController
  def index
    @posts = Post.limit(3)
    render :template => 'news/show'
  end
end
