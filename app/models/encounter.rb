class Encounter < ActiveRecord::Base
	has_and_belongs_to_many :characters
	accepts_nested_attributes_for :characters, allow_destroy: true, reject_if: lambda {|attributes| attributes['level'].blank?}
end
