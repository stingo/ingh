class AddGenderToProfiles < ActiveRecord::Migration[5.0]
  def change
  	add_column :profiles, :displayname, :string
    add_column :profiles, :date_of_birth, :datetime
    add_column :profiles, :is_female, :boolean, default: false
  end
end
