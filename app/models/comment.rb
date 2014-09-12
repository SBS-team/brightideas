class Comment < ActiveRecord::Base
  acts_as_tree order: 'created_at DESC', dependent: :destroy

  acts_as_votable

  belongs_to :idea, :counter_cache => true
  belongs_to :user

end
