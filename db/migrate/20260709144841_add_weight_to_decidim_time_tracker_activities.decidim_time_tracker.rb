# This migration comes from decidim_time_tracker (originally 20260527175301)
class AddWeightToDecidimTimeTrackerActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :decidim_time_tracker_activities, :weight, :integer, default: 0, null: false
  end
end
