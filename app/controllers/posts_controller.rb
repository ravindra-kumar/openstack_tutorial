class PostsController < ApplicationController
  before_action :logged_in_user, except: [:show]

  def index
  end

  def create
    return if params[:post][:post_message].blank? || params[:post][:title].blank?
    params[:post][:user_id] = current_user.id
    @post = Post.new(post_params)
    if @post.save
      flash[:info] = "Post successfully created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def new
    @post = Post.new
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
    else
      @post.dislike(@post, current_user)
    end
  end

  def follow_or_unfollow
    @post = Post.find params[:id]
    if params[:follow].to_i == 1
      @post.follow_post(current_user)
    else
      @post.unfollow_post(current_user)
    end
  end

  private
    
    def post_params
      params.require(:post).permit(:title, :post_message, :user_id)
    end

end
