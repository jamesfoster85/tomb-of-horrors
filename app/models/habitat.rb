class Habitat < ActiveRecord::Base
	has_many :encounters
	has_and_belongs_to_many :monsters
end
