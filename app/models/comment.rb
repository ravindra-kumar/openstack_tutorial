class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }
  belongs_to :user
  validates_length_of :comment, :minimum => 2, :maximum => 100, :allow_blank => false
  delegate :name, to: :user
end
