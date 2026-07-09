# This migration comes from decidim_time_tracker (originally 20260527172939)
class AddWeightToDecidimTimeTrackerTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :decidim_time_tracker_tasks, :weight, :integer, default: 0, null: false
  end
end
