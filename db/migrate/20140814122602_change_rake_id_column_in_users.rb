class ChangeRakeIdColumnInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :rank_id, :integer, null: true
  end
end
