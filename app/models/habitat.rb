class Habitat < ActiveRecord::Base
	has_and_belongs_to_many :monsters
end
