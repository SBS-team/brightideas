class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string  :path
      t.integer :idea_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
