class AddAttributesToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
  end
end
