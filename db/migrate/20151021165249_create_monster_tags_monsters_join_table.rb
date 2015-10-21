class CreateMonsterTagsMonstersJoinTable < ActiveRecord::Migration
  def change
  	create_table :monster_tags_monsters, id: false do |t|
  		t.integer :monster_tag_id
  		t.integer :monster_id
  	end

  	add_index :monster_tags_monsters, :monster_tag_id
  	add_index :monster_tags_monsters, :monster_id
  end
end
