class AddUrbantermcoverToUrbanTerms < ActiveRecord::Migration[5.0]
  def change
    add_column :urban_terms, :urbantermcover, :string
  end
end
