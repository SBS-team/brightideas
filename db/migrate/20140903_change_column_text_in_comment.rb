class ChangeColumnTextInComment < ActiveRecord::Migration
  def change
    remove_column :comments, :text
    add_column :comments, :text, :text
  end

end
