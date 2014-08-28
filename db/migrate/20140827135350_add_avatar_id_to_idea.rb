class AddAvatarIdToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :avatar_id, :integer
  end
end
