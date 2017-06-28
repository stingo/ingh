class RemoveFirstNameFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :first_name, :string
    remove_column :profiles, :last_name, :string
  end
end
