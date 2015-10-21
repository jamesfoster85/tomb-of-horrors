class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
    	t.string :name
    	t.string :size
    	t.string :nature

      t.timestamps
    end
  end
end
