class AddRatingToHows < ActiveRecord::Migration[5.1]
  def change
    add_column :hows, :rating, :integer
  end
end
