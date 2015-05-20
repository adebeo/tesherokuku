OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "865440156861174", "72517aa5f3fcfcec5ce38b211fdd5bdf"
end