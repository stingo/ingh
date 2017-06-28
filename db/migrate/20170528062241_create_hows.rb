class CreateHows < ActiveRecord::Migration[5.0]
  def change
    create_table :hows do |t|
      t.string :title
      t.text :body
      t.string :howcover
      t.string :video
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
