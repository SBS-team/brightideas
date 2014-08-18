class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :number, null: false	
      t.timestamps
    end
  end
end
