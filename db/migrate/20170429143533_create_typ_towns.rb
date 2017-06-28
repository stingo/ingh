class CreateTypTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :typ_towns do |t|
      t.string :name
      t.belongs_to :typ_country
      t.timestamps
    end
  end
end
