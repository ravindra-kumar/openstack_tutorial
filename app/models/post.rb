class Post < ActiveRecord::Base

  belongs_to :user
  delegate :name, to: :user
  acts_as_commentable
  self.per_page = 10
  scope :get_posts, lambda { |page|
     order('created_at DESC').paginate(page: page)
  }
  #has_many :comments
end
