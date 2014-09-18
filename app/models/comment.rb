class Comment < ActiveRecord::Base
  acts_as_tree dependent: :destroy

  acts_as_votable

  belongs_to :idea, :counter_cache => true
  belongs_to :user

  validates :text, :user, :idea, presence: true

end
