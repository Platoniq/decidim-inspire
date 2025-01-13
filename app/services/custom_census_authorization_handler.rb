# frozen_string_literal: true

# Checks the authorization against the census for Barcelona.
require "digest/md5"

# This class performs a check against the census file in order to verify the citizen's residence.
class CustomCensusAuthorizationHandler < Decidim::AuthorizationHandler
  attribute :date_of_birth, Date

  validates :date_of_birth, presence: true

  validate :present_in_census

  def metadata
    super.merge(date_of_birth: parsed_date_of_birth)
  end

  def unique_id
    Digest::MD5.hexdigest("#{user.email}-#{Rails.application.secrets.secret_key_base}")
  end

  private

  def parsed_date_of_birth
    @parsed_date_of_birth ||= date_of_birth&.strftime("%Y-%m-%d")
  end

  def present_in_census
    result = census.find { |row| row["email"] == user.email }
    return errors.add(:base, I18n.t("custom_census_authorization_handler.errors.not_found")) unless result

    errors.add(:date_of_birth, I18n.t("custom_census_authorization_handler.errors.invalid_date_of_birth")) unless result["date_of_birth"] == parsed_date_of_birth
  end

  def census
    @census ||= CSV.read(Rails.root.join("lib/assets/custom_census.csv"), headers: true)
  end
end
