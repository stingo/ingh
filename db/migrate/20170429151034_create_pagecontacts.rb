class CreatePagecontacts < ActiveRecord::Migration[5.0]
  def change
    create_table :pagecontacts do |t|
    	t.string :address1, null: false
    	t.string :address2
    	t.string :city, null: false
    	t.string :postal_code
    	t.string :pageemail
    	t.string :business_number
    	t.string :cell_number
        t.float :latitude
        t.float :longitude
        t.string :avatar
    	t.belongs_to :typ_contact
    	t.belongs_to :typ_country
    	t.belongs_to :typ_region
    	t.belongs_to :typ_town
        t.belongs_to :page
        t.belongs_to :profile
      	t.timestamps
    end
  end
end
