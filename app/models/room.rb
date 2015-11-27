class Room < ActiveRecord::Base
	belongs_to :dungeon

	StartingAreas = [
		"Square, 20 x 20 ft.; passage on each wall",
		"Square, 20 x 20 ft.; door on two walls, passage in third wall",
		"Square, 40 x 40 ft.; door on three walls",
		"Rectangle, 80 x 20 ft.; with row of pillars down the middle; two passages leading from each long wall, doors on each short wall",
		"Rectangle, 20 x 40 ft.; passage on each wall",
		"Circle, 40 ft. diameter; one passage at each cardinal direction",
		"Circle, 40 ft. diameter; one passage at each cardinal direction; well in middle of rom (might lead down to lower level)",
		"Square, 20 x 20 ft.; door on two walls, passage on third wall, secret door on fourth wall",
		"Passage, 10 ft. wide; T intersection",
		"Passage, 10 ft. wide; four-way intersection"
	]
end
