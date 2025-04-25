# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overridden is the same
# as the expected. If this test fails, it means that the overridden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-accountability",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "54ff008b69aa8c380f2f4f4b91b0bd20"
    }
  },
  {
    package: "decidim-admin",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "8780efdeb3a9f2feb7f0f4ace2e48eaa"
    }
  },
  {
    package: "decidim-assemblies",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "93293aec0a874a745342f3fe76d4b9b7"
    }
  },
  {
    package: "decidim-blogs",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "1e2783c2469d77d4a90c0e314868432c"
    }
  },
  {
    package: "decidim-budgets",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "681d8578077713b0aeb226562d24b84a"
    }
  },
  {
    package: "decidim-comments",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "87064231decf4df783b50cf72b51fae7"
    }
  },
  {
    package: "decidim-core",
    files: {
      # views
      "/app/views/layouts/decidim/footer/_mini.html.erb" => "ccead2f5f20557ea4db1501de943f82b",
      # locales
      "/config/locales/ca-IT.yml" => "2bca7f74a3b4e870cc795ff2b60960c2"
    }
  },
  {
    package: "decidim-forms",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "3a72c4defd5d44206ae090b904b42ecf"
    }
  },
  {
    package: "decidim-meetings",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "ee7c38332c17091135164fe879934cb9"
    }
  },
  {
    package: "decidim-proposals",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "cdcff4319a62a8342e764a1509ce8f25"
    }
  },
  {
    package: "decidim-surveys",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "d6a9399d4df0df163792523c35c8fccb"
    }
  },
  {
    package: "decidim-system",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "6fdc9882dadcb57d765988347ee92e45"
    }
  },
  {
    package: "decidim-verifications",
    files: {
      # locales
      "/config/locales/ca-IT.yml" => "f8ba8888774fbd2ce6c0dd118a545279"
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
