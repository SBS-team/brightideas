class Comment < ActiveRecord::Base
  acts_as_votable

  belongs_to :idea, :counter_cache => true
  belongs_to :user

  validates :text, :user, :idea, presence: true
  acts_as_tree order: 'created_at', dependent: :destroy
end
