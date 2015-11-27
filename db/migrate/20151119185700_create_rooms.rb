class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :length
      t.integer :width

      t.timestamps
    end
  end
end
