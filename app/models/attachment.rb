
class Attachment < ActiveRecord::Base
	belongs_to :idea
  mount_uploader :path, AttachmentUploader
  include Rails.application.routes.url_helpers
  validates :path, presence: true

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
