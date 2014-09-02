class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :idea_id
      t.integer :user_id
      t.float :rate

      t.timestamps
    end
  end
end
