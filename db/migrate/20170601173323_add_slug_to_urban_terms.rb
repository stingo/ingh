class AddSlugToUrbanTerms < ActiveRecord::Migration[5.0]
  def change
    add_column :urban_terms, :slug, :string
    add_index :urban_terms, :slug, unique: true
  end
end
