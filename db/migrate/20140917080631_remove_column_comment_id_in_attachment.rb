class RemoveColumnCommentIdInAttachment < ActiveRecord::Migration
  def change
    remove_column :attachments, :comment_id
  end
end
