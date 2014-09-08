class Comment < ActiveRecord::Base
  acts_as_tree order: 'created_at DESC'

  acts_as_votable

  has_many   :attachments
  belongs_to :idea
  belongs_to :user

end
