class CreateHabitats < ActiveRecord::Migration
  def change
    create_table :habitats do |t|
      t.string :name

      t.timestamps
    end
  end
end
