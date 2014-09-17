class Idea < ActiveRecord::Base
  has_many   :comments, dependent: :destroy
  has_many   :attachments, dependent: :destroy
  has_many   :ratings, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for  :attachments
  validates :title, :description, :user, presence: true
end
