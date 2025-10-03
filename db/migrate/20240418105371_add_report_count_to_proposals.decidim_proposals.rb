# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20170215131720)
# This file has been modified by `decidim upgrade:migrations` task on 2025-10-03 09:06:17 UTC
class AddReportCountToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_proposals_proposals, :report_count, :integer, default: 0
  end
end
