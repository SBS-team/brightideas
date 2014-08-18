class Idea < ActiveRecord::Base
  has_many   :comments
  has_many   :attachments
  belongs_to :user
end
