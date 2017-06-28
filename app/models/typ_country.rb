class TypCountry < ActiveRecord::Base
	has_many :pagecontact
	has_many :pesncontact
	has_many :typ_region
	has_many :typ_town
end
