# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overridden is the same
# as the expected. If this test fails, it means that the overridden
# file should be updated to match any change/bug fix introduced in the core

checksums = [
  {
    package: "decidim-core",
    files: {
      # views
      "/app/views/layouts/decidim/footer/_mini.html.erb" => "ccead2f5f20557ea4db1501de943f82b"
    }
  },

  {
    package: "decidim-meetings",
    files: {
      # locales
      "/config/locales/en.yml" => "dbfe32a52f22f336b5f356973102d321"
    }
  }
]

describe "Overridden files", type: :view do
  checksums.each do |item|
    spec = Gem::Specification.find_by_name(item[:package])
    item[:files].each do |file, signature|
      next unless spec

      it "#{spec.gem_dir}#{file} matches checksum" do
        expect(md5("#{spec.gem_dir}#{file}")).to eq(signature)
      end
    end
  end

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
