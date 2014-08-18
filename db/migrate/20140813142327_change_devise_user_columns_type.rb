class ChangeDeviseUserColumnsType < ActiveRecord::Migration
  def change
  	change_column :users, :office_num, :string, :default => ""
  end
end
