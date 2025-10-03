# frozen_string_literal: true

# This migration comes from decidim (originally 20180706111847)
# This file has been modified by `decidim upgrade:migrations` task on 2025-10-03 09:06:16 UTC
class FixResultFollows < ActiveRecord::Migration[5.2]
  def change
    # rubocop:disable Rails/SkipsModelValidations
    Decidim::Follow.where(decidim_followable_type: "Decidim::Results::Result").update_all(decidim_followable_type: "Decidim::Accountability::Result")
    # rubocop:enable Rails/SkipsModelValidations
  end
end
