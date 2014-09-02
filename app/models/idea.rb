class Idea < ActiveRecord::Base
  has_many   :comments
  has_many   :attachments
  has_many   :ratings
  belongs_to :user
  accepts_nested_attributes_for  :attachments
  validates_presence_of :title, :description
end
