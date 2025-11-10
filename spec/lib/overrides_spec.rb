# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overridden is the same
# as the expected. If this test fails, it means that the overridden
# file should be updated to match any change/bug fix introduced in the core

checksums = [
  {
    package: "decidim-accountability",
    files: {
      "/app/models/decidim/accountability/result.rb" => "fc2b2774dd6d7deb99b6ba96a810fb45"
    }
  },
  {
    package: "decidim-core",
    files: {
      # views
      "/app/views/layouts/decidim/footer/_mini.html.erb" => "c67cc97db27cdcf926f60682e399f688"
    }
  },
  {
    package: "decidim-meetings",
    files: {
      # locales
      "/config/locales/en.yml" => "918c3456d3c59b2713e311c7b6f475ae"
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
