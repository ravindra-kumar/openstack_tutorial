class PostsController < ApplicationController
  before_action :logged_in_user, except: [:show]

  def index
  end

  def create
    return if params[:post_message].blank?
    
  end

  def show
    @post = Post.find params[:id]
  end

  def put_comment
  end

  # private

  # def check_user_session
  #   redirect_to login_url unless logged_in? 
  # end
end
