class CreateJoinTableHabitatMonster < ActiveRecord::Migration
  def change
  	create_table :habitats_monsters, id: false do |t|
  		t.integer :habitat_id
  		t.integer :monster_id
  	end

  	add_index :habitats_monsters, :habitat_id
  	add_index :habitats_monsters, :monster_id
  end
end
