class CreateCreatures < ActiveRecord::Migration
  def change
    create_table :creatures do |t|
    	t.integer :monster_id
    	t.integer :encounter_id

      t.timestamps
    end
  end
end
