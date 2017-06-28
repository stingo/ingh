class CreateTypPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :typ_positions do |t|
    	t.string :name
      	t.timestamps
    end
  end
end
