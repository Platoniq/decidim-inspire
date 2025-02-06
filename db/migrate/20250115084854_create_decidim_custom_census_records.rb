class CreateDecidimCustomCensusRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :decidim_custom_census_records do |t|
      t.string :email, null: false
      t.jsonb :metadata

      Decidim::Authorization
      t.timestamps
    end

    add_index :decidim_custom_census_records, :email, unique: true
  end
end
