class CreateTypRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :typ_regions do |t|
    	t.string :name
    	t.string :timezone
    	t.belongs_to :typ_country
    	t.timestamps
    end
  end
end

