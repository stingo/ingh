class AddAttributesToHows < ActiveRecord::Migration[5.0]
  def change
    add_column :hows, :subtitle, :string
    add_column :hows, :subtitle1, :string
    add_column :hows, :subtitle2, :string
    add_column :hows, :subtitle3, :string
    add_column :hows, :subtitle4, :string
    add_column :hows, :subbody1, :text
    add_column :hows, :subbody2, :text
    add_column :hows, :subbody3, :text
    add_column :hows, :subbody4, :text
    add_column :hows, :days, :integer
    add_column :hows, :hours, :integer
    add_column :hows, :minutes, :integer
    add_column :hows, :recipetips, :text
  end
end
