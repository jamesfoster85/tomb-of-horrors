class Monster < ActiveRecord::Base
	has_and_belongs_to_many :monster_tags
	accepts_nested_attributes_for :monster_tags, reject_if: lambda {|attributes| attributes['tag'].blank?}
end
