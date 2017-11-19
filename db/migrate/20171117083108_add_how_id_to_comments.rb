class AddHowIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :how_id, :integer
    add_index :comments, :how_id
  end
end
