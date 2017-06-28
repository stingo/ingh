class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
    	t.belongs_to :typ_position
    	t.belongs_to :page
    	t.string :first_name, null: false
    	t.string :last_name, null: false

      t.timestamps
    end
  end
end
