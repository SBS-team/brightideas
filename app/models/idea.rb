class Idea < ActiveRecord::Base
  has_many   :comments, dependent: :destroy
  has_many   :attachments, dependent: :destroy
  has_many   :ratings, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for  :attachments
  #---------------------------------------
  accepts_nested_attributes_for :comments
  #---------------------------------------
  validates :title, :description, :user, presence: true

  before_save :escape_html_from_description

  def escape_html_from_description
    self.description = ActionController::Base.helpers.strip_tags(self.description)
  end

end