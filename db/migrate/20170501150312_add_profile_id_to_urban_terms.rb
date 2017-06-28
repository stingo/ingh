class AddProfileIdToUrbanTerms < ActiveRecord::Migration[5.0]
  def change
    add_column :urban_terms, :profile_id, :integer


    add_index :urban_terms, [:profile_id, :created_at]
  end
end
