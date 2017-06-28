class Pesncontact < ApplicationRecord
	belongs_to :profile, foreign_key: "profile_id"
	belongs_to :page, foreign_key: "page_id"
	belongs_to :typ_contact, foreign_key: "typ_contact_id"
	belongs_to :typ_country, foreign_key: "typ_country_id"
	belongs_to :typ_region, foreign_key: "typ_region_id"
	belongs_to :typ_town, foreign_key: "typ_town_id"

	#mount_uploader :pesnavatar, PesnavatarUploader
end
