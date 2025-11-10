# frozen_string_literal: true

module Decidim
  module Accountability
    module ResultOverride
      extend ActiveSupport::Concern

      included do
        def self.ransackable_associations(auth_object = nil) # rubocop:disable Lint/UnusedMethodArgument
          %w(taxonomies status)
        end
      end
    end
  end
end
