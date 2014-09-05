class ChangeColumnGenerationBetweenInCommentHierarchy < ActiveRecord::Migration
  def change
    remove_column :comment_hierarchies, :generations_between
    add_column :comment_hierarchies, :generations, :integer, :null => false
    add_index :comment_hierarchies, [:ancestor_id, :descendant_id, :generations],
        :unique => true, :name => "ancestor_descendant_idx"
  end
  # remove_index :comment_hierarchies, :name => "ancestor_descendant_idx"

end
