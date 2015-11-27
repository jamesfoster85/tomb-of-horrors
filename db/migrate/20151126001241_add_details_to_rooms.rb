class AddDetailsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :description, :string
    add_column :rooms, :type, :string
  end
end
