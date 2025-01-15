# frozen_string_literal: true

module Decidim
  class CustomCensusRecord < ApplicationRecord
    include Decidim::RecordEncryptor

    validates :email, uniqueness: true

    encrypt_attribute :metadata, type: :hash

    def date_of_birth
      metadata["date_of_birth"]
    end
  end
end
