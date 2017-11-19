class UrbanTerm < ApplicationRecord
	#belongs_to :profile
  acts_as_taggable

	belongs_to :profile, foreign_key:"profile_id"

	is_impressionable

  acts_as_votable

  acts_as_followable

  

	#searchkick text_start: [:title], suggest: [:title]

	mount_uploader :urbantermcover, UrbantermcoverUploader

  extend FriendlyId
  friendly_id :title, use: :slugged #Replaces #before_save :update_slug #def update_slug #def to_param


  #def search_data
    #{
      #title: title,
      #body: description,
     
    #}
  #end

  #def self.tagged_with(name)
  #Tag.find_by_name!(name).urban_terms
#end
end

