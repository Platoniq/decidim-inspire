# Re-append app locale files after all engine initializers have run so our
# translations take precedence over gem defaults for the same keys.
Rails.application.config.after_initialize do
  I18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
  I18n.backend.reload!
end
