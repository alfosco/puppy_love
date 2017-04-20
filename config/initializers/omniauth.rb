Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "#{Figaro.env.google_oauth_client_id}", "#{Figaro.env.google_oauth_client_secret}", {
    :name => "google",
    :scope => ['contacts','plus.login','plus.me','email','profile'],
    :prompt => "select_account",
    :image_aspect_ratio => "square",
    :image_size => 50,
    :access_type => 'offline'
  }
end
