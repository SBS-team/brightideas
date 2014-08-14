require 'carrierwave'
class Attachment < ActiveRecord::Base
	belongs_to :idea
	belongs_to :comment
  mount_uploader :path, AttachmentUploader

end
