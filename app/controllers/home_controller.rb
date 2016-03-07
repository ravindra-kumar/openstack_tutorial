class HomeController < ApplicationController
  def index
    @posts = Post.get_posts(params[:page])
  end
end
