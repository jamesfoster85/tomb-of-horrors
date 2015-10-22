class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
    	t.integer :difficulty

      t.timestamps
    end
  end
end
