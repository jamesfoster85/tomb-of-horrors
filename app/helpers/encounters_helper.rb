module EncountersHelper
	def multiplier(party_size, encounter_size)
		if party_size < 3
			party_size = 0
		elsif party_size < 6
			party_size = 1
		else
			party_size = 2
		end		

		if encounter_size == 1
			[1.5, 1, 0.5][party_size]
		elsif encounter_size == 2
			[2, 1.5, 1][party_size]
		elsif encounter_size < 7
			[2.5, 2, 1.5][party_size]
		elsif encounter_size < 11
			[3, 2.5, 2][party_size]
		elsif encounter_size < 15
			[4, 3, 2.5][party_size]
		else
			[5, 4, 3][party_size]
		end
	end

	def possible_encounters(characters, difficulty)
		thresholds = [
			[0, 0, 0, 0],	
			[25, 50, 75, 100],
			[50, 100, 150, 200],
			[75, 150, 225, 400],
			[125, 250, 375, 500],
			[250, 500, 750, 1100],
			[300, 600, 900, 1400],
			[350, 750, 1100, 1700],
			[450, 900, 1400, 2100],
			[550, 1100, 1600, 2400],
			[600, 1200, 1900, 2800],
			[800, 1600, 2400, 3600],
			[1000, 2000, 3000, 4500],
			[1100, 2200, 3400, 5100],
			[1250, 2500, 3800, 5700],
			[1400, 2800, 4300, 6400],
			[1600, 3200, 4800, 7200],
			[2000, 3900, 5900, 8800],
			[2100, 4200, 6300, 9500],
			[2400, 4900, 7300, 10900],
			[2800, 5700, 8500, 12700],
			[3200, 6500, 9700, 14500]
		]

		xp_by_cr = Monster::XPS

		party_size = characters.size
		character_levels = characters.map{|character| character.level}
		party_level = character_levels.reduce(:+) / character_levels.size
		character_thresholds_low = character_levels.map{|level| thresholds[level][difficulty]}
		party_threshold_low = character_thresholds_low.reduce(:+)
		if difficulty == 3
			character_thresholds_high = character_levels.map{|level| thresholds[(level + 1)][difficulty]}
		else
			character_thresholds_high = character_levels.map{|level| thresholds[level][(difficulty + 1)]}
		end
		party_threshold_high = character_thresholds_high.reduce(:+)
		encounters = []
		new_encounters = []
		encounter_size = 1
		until encounters.empty? == false && new_encounters.empty?
			current_multiplier = multiplier(party_size, encounter_size)
			current_low = party_threshold_low/current_multiplier
			current_high = party_threshold_high/current_multiplier
			appropriate_crs = xp_by_cr.select{|cr| cr < (current_high / 
				( 1 + ( (encounter_size - 1) * (party_level / 20.0) ) ) )}.pop((10 - encounter_size))
			new_encounters = appropriate_crs.repeated_combination(encounter_size).select{|cr| cr.reduce(:+) >= current_low && cr.reduce(:+) < current_high}
			encounters.concat(new_encounters)
			encounter_size += 1
			puts party_level
		end
		encounters
	end

	def format_all(encounters)
		encounters.map{|encounter| format_each(encounter)}
	end

	def format_each(encounter)
		encounter.uniq.map{|cr| { encounter.count(cr) => cr } }
	end

	def valid_encounters(characters, difficulty, monsters)
		xps = monsters.map{|monster| monster.xp}.uniq
		possible_encounters(characters, difficulty).select{|encounter| encounter.all?{|creature| xps.include?(creature)}}
	end

	def monsters_by_xp(monsters)
		monsters.group_by{|monster| monster.xp }
	end
end
