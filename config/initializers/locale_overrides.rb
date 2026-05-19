# frozen_string_literal: true

# Re-append app locale files after all engine initializers have run so our
# translations take precedence over gem defaults for the same keys.
Rails.application.config.after_initialize do
  I18n.load_path += Rails.root.glob("config/locales/**/*.{rb,yml}")
  I18n.backend.reload!
end
