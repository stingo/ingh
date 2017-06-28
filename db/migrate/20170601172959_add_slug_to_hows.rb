class AddSlugToHows < ActiveRecord::Migration[5.0]
  def change
    add_column :hows, :slug, :string
    add_index :hows, :slug, unique: true
  end
end
