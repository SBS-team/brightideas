class Idea < ActiveRecord::Base
  has_many   :comments #FIXME dependent destroy
  has_many   :attachments #FIXME dependent destroy
  has_many   :ratings #FIXME dependent destroy
  belongs_to :user
  accepts_nested_attributes_for  :attachments
  validates_presence_of :title, :description #FIXME old style
end
