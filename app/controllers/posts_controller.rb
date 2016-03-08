class PostsController < ApplicationController
  before_action :logged_in_user, except: [:show]

  def index
  end

  def create
    return if params[:post_message].blank?
    
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments
  end

  def put_comment
    post = Post.find(params[:id])
    comment = post.comments.build(title: params[:Title], comment: params[:comment], user_id: current_user.id)
    if comment.save
      @comments = post.comments
    else
      render text: "Something wrong" 
    end
  end

  def like_or_dislike
    @post = Post.find params[:id]
    if params[:like].to_i == 1
      @post.like(@post, current_user)
      like = 1
    else
      @post.dislike(@post, current_user)
      like = 0
    end
  end

end
