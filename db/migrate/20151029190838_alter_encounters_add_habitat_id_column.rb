class AlterEncountersAddHabitatIdColumn < ActiveRecord::Migration
  def change
  	add_column :encounters, :habitat_id, :integer
  	add_index :encounters, :habitat_id
  end
end
