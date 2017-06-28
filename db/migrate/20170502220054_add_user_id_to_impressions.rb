class AddUserIdToImpressions < ActiveRecord::Migration[5.0]
  def change
    add_column :impressions, :user_id, :integer
    add_index :impressions, :user_id
  end
end
