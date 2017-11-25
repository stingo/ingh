class Comment < ActiveRecord::Base
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  validates :body, :presence => true
  validates :profile, :presence => true


  # NOTE: install the acts_as_votable plugin if you
  # want profile to vote on the quality of comments.
  #acts_as_votable

  belongs_to :commentable, :polymorphic => true

   belongs_to :hows

  # NOTE: Comments belong to a profile
  belongs_to :profile

  # Helper class method that allows you to build a comment
  # by passing a commentable object, a profile_id, and comment text
  # example in readme
  def self.build_from(obj, profile_id, comment,rating)
    new \
      :commentable => obj,
      :body        => comment,
      :profile_id     => profile_id,
      :rating => rating
  end

  #helper method to check if a comment has children
  def has_children?
    self.children.any?
  end

  # Helper class method to lookup all comments assigned
  # to all commentable types for a given profile.
  scope :find_comments_by_profile, lambda { |profile|
    where(:profile_id => profile_id).order('created_at DESC')
  }

  # Helper class method to look up all comments for
  # commentable class name and commentable id.
  scope :find_comments_for_commentable, lambda { |commentable_str, commentable_id|
    where(:commentable_type => commentable_str.to_s, :commentable_id => commentable_id).order('created_at DESC')
  }

  # Helper class method to look up a commentable object
  # given the commentable class name and id
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end
end
