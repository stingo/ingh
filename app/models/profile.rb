class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   acts_as_follower
   acts_as_followable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :urban_terms, dependent: :destroy # remove a profile's urban_terms if his account is deleted.
    has_many :hows, dependent: :destroy # remove a profile's urban_terms if his account is deleted.

    has_many :comments, dependent: :destroy 
     #has_and_belongs_to_many :pesn_contacts
     #has_and_belongs_to_many :pagecontacts
	#belongs_to :page, foreign_key:"page_id"
	#belongs_to :typ_position, foreign_key:"typ_position_id"
	 #accepts_nested_attributes_for :pagecontacts
	#accepts_nested_attributes_for :pesn_contacts

is_impressionable


	enum gender: [:female, :male]




  has_many :likes, dependent: :destroy
         
        #has_many :comments, dependent: :destroy


         def likes?(definition)
         definition.likes.where(user_id: id).any?
         end




	mount_uploader :pesnavatar, PesnavatarUploader
end
