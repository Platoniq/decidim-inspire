# frozen_string_literal: true

# This migration comes from decidim (originally 20170130132833)
# This file has been modified by `decidim upgrade:migrations` task on 2025-10-03 09:06:16 UTC
class AddFaviconToDecidimOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_organizations, :favicon, :string
  end
end
