Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'a66e6ad8e0a72b9fd516', 'bc5f3187a2e33a65d8bb25214b5af66dc44448ec'
end
