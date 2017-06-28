class TypTown < ActiveRecord::Base
	belongs_to :typ_country, foreign_key: "typ_country_id"
	has_many :pagecontacts
	has_many :pesncontacts

end
