class Post < ActiveRecord::Base

  belongs_to :user
  delegate :name, to: :user
  acts_as_commentable
  self.per_page = 10
  scope :get_posts, lambda { |page|
     order('created_at DESC').paginate(page: page)
  }
  acts_as_votable
  acts_as_followable


  def like(post, current_user)
    post.vote_by voter: current_user, vote: 'like'
  end

  def dislike(post, current_user)
    post.vote_by voter: current_user, vote: 'bad'
  end

  def follow_post(current_user)
    current_user.follow(self)
  end

  def unfollow_post(current_user)
    current_user.stop_following(self)
  end

end
