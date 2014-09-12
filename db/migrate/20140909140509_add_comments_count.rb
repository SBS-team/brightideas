class AddCommentsCount < ActiveRecord::Migration
  def change
    add_column :ideas, :comments_count, :integer, :default => 0

    #Idea.reset_column_information
    #Idea.all.each do |item|
    #  item.update_attribute :comments_count, item.comments.length
    end
  end
end
