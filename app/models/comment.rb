class Comment < ActiveRecord::Base
  acts_as_tree

  acts_as_votable

  has_many   :attachments
  belongs_to :idea
  belongs_to :user

end
