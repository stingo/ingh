class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :name, null: false
      t.text :pagedesc
      t.string :pageavatar
      t.string :verification_doc
      t.boolean :verified
      t.belongs_to :typ_page

      t.timestamps
    end
  end
end

