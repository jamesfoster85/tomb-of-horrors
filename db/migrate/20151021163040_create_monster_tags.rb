class CreateMonsterTags < ActiveRecord::Migration
  def change
    create_table :monster_tags do |t|
    	t.string :tag

      t.timestamps
    end
  end
end
