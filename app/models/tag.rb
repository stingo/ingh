class Tag < ActiveRecord::Base
  #has_many :tags, through: :taggings
  #has_many :taggings, dependent: :destroy
end
