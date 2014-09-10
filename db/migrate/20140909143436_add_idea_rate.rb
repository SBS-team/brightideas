class AddIdeaRate < ActiveRecord::Migration
  def change
    add_column :ideas, :rate, :float, :default => 0.0
  end
end
