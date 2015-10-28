class AddXpToMonsters < ActiveRecord::Migration
  def change
  	add_column :monsters, :xp, :integer
  end
end
