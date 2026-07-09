# frozen_string_literal: true

# This migration comes from decidim_time_tracker (originally 20260625100001)
class AddCompletedAtToTimeTrackerAssignations < ActiveRecord::Migration[7.0]
  def change
    add_column :decidim_time_tracker_assignations, :completed_at, :datetime
  end
end
