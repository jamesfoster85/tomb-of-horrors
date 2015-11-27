class CreateDungeons < ActiveRecord::Migration
  def change
    create_table :dungeons do |t|

      t.timestamps
    end

    add_column :rooms, :dungeon_id, :integer
  end
end
