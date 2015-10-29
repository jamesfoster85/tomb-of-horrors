class Monster < ActiveRecord::Base
	has_and_belongs_to_many :habitats
	has_and_belongs_to_many :monster_tags
	accepts_nested_attributes_for :monster_tags, allow_destroy: true, reject_if: lambda {|attributes| attributes['tag'].blank?}

	XPS = [0, 10, 25, 50, 100, 200, 450, 700, 1100, 1800, 2300, 2900, 3900, 5000, 5900, 7200, 8400, 10000, 11500, 13000, 15000, 18000, 20000, 22000, 24500, 33000, 41000, 50000, 62000, 75000, 90000, 105000, 120000, 135000, 155000]

end
