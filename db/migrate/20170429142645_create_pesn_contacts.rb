class CreatePesnContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :pesn_contacts do |t|
    	t.string :address1
    	t.string :address2
    	t.string :city, null: false
    	t.string :postal_code
    	t.string :email, null: false
    	t.string :cell_number
        t.string :pesnavatar
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
