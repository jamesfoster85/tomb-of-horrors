class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
    	t.integer :level

      t.timestamps
    end
  end
end
