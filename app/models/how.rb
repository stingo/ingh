class How < ApplicationRecord
 
  belongs_to :profile, foreign_key:"profile_id"

  mount_uploader :howcover, HowcoverUploader

has_many :comments

  acts_as_commentable

  acts_as_votable

  is_impressionable

  #searchkick text_start: [:title], suggest: [:title]

  extend FriendlyId
  friendly_id :title, use: :slugged #Replaces #before_save :update_slug #def update_slug #def to_param


  #def search_data
    #{
      #title: title,
      #body: body,
     
    #}
  #end


end
