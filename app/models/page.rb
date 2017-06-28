class Page < ApplicationRecord
	has_and_belongs_to_many :paagecontacts
	# has_many :profiles
	belongs_to :typ_page, foreign_key: "typ_page_id"
	belongs_to :typ_company, foreign_key: "typ_company_id"
	validates :typ_company, presence: true
	validates :name, presence: true
	accepts_nested_attributes_for :typ_company
	accepts_nested_attributes_for :pagecontacts

end
