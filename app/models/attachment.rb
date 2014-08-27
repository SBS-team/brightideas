 require 'carrierwave'

class Attachment < ActiveRecord::Base
	belongs_to :idea
	belongs_to :comment
  mount_uploader :path, AttachmentUploader
   # has_attached_file :Attachment
  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
        "name" => read_attribute(:path),
        "size" => path.size,
        "url" => path.url,
        "thumbnail_url" => path.thumb.url,
        "delete_url" => attachment_path(self),
        "delete_type" => "DELETE",
        "attachment_id" => self.id
    }
  end
end
