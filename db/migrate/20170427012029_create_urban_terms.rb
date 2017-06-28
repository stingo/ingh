class CreateUrbanTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :urban_terms do |t|
      t.string :title
      t.text :description
      t.text :inaction
      t.string :postcover


      t.timestamps
    end
  end
end
