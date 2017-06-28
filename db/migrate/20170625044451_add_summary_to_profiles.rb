class AddSummaryToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :summary, :text
    add_column :profiles, :profilecover, :string
    add_column :profiles, :loctown, :string
    add_column :profiles, :loccountry, :string
    add_column :profiles, :currjobtitle, :string
    add_column :profiles, :currtemployer, :string
    add_column :profiles, :curremployerstartdate, :datetime
    add_column :profiles, :employer2name, :string
    add_column :profiles, :employer2jobtitle, :string
    add_column :profiles, :employer2startdate, :datetime
    add_column :profiles, :employer2finishdate, :datetime
    add_column :profiles, :employer3name, :string
    add_column :profiles, :employer3jobtitle, :string
    add_column :profiles, :employer3startdate, :datetime
    add_column :profiles, :employer3finishdate, :datetime
    add_column :profiles, :employer4name, :string
    add_column :profiles, :employer4jobtitle, :string
    add_column :profiles, :employer4startdate, :datetime
    add_column :profiles, :employer4finishdate, :datetime
    add_column :profiles, :recentqualificationtitle, :string
    add_column :profiles, :recentqualificationname, :string
    add_column :profiles, :recentschoolname, :string
  end
end


    