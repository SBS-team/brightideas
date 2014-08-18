class CreateCommentHierarchies < ActiveRecord::Migration
  def change
    create_table :comment_hierarchies, :id => false do |t|
      t.integer :ancestor_id,   		null: false
      t.integer :descendant_id, 		null: false
      t.integer :generations_between,	null: false
    end
  add_index :comment_hierarchies, [:ancestor_id, :descendant_id, :generations_between],
  		    :unique => true, :name => "ancestor_descendant_idx"

  add_index :comment_hierarchies, [:descendant_id],
    		:name => "descendant_idx"	
  end
end
