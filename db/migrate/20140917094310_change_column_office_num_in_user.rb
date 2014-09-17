class ChangeColumnOfficeNumInUser < ActiveRecord::Migration
  def change
    remove_column :users, :office_num
    add_column :users, :office_id, :integer
  end
end
