class CreateCharactersEncountersJoinTable < ActiveRecord::Migration
  def change
  	create_table :characters_encounters, id: false do |t|
  		t.integer :character_id
  		t.integer :encounter_id
  	end

  	add_index :characters_encounters, :character_id
  	add_index :characters_encounters, :encounter_id
  end
end
