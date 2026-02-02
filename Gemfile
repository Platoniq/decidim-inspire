# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "0.31.1"

gem "decidim", DECIDIM_VERSION
gem "decidim-accountability", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
# gem "decidim-design", DECIDIM_VERSION
gem "decidim-elections", DECIDIM_VERSION
# gem "decidim-initiatives", DECIDIM_VERSION
# gem "decidim-templates", DECIDIM_VERSION

# gem "decidim-comparative_stats", git: "https://github.com/Platoniq/decidim-module-comparative_stats", branch: "master"
# gem "decidim-decidim_awesome", "~> 0.13.1"
# gem "decidim-direct_verifications", git: "https://github.com/Platoniq/decidim-verifications-direct_verifications", branch: "main"
# gem "decidim-kids", git: "https://github.com/AjuntamentdeBarcelona/decidim-module-kids", branch: "main"
# gem "decidim-notify", git: "https://github.com/Platoniq/decidim-module-notify.git", branch: "main"
# gem "decidim-superspaces", git: "https://github.com/Platoniq/decidim-superspace", branch: "main"
# gem "decidim-term_customizer", git: "https://github.com/Platoniq/decidim-module-term_customizer", branch: "main"

gem "bootsnap", "~> 1.3"

gem "puma", ">= 6.3.1"

gem "wicked_pdf", "~> 2.1"

gem "graphlient", "0.5.0"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "brakeman", "~> 5.4"
  gem "decidim-dev", DECIDIM_VERSION
  gem "net-imap", "~> 0.2.3"
  gem "net-pop", "~> 0.1.1"
  gem "net-smtp", "~> 0.5.0"
end

group :development do
  gem "letter_opener_web", "~> 2.0"
  gem "listen", "~> 3.1"
  gem "mdl"
  gem "web-console", "~> 4.2"

  gem "capistrano"
  gem "capistrano-bundler"
  gem "capistrano-passenger"
  gem "capistrano-rails"
  gem "capistrano-rbenv"
  gem "capistrano-sidekiq"
end

group :production do
  gem "aws-sdk-s3", require: false
  gem "figaro", "~> 1.2"
  gem "sidekiq", "~> 6.0"
  gem "whenever", require: false
end