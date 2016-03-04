class PostsController < ApplicationController
  before_filter :check_user_session
  def index
  end

  def create
    return if params[:post_message].blank?
    
  end

  private

  def check_user_session
    redirect_to login_url unless logged_in? 
  end
end
