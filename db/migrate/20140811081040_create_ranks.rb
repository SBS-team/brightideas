class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :name, null: false, default: ""
      t.timestamps
    end
  end
end
