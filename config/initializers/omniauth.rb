OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '918264868297-sd9qvsur1ad33k8mfhj0h0312n9u59li.apps.googleusercontent.com', 'XW1rmt3c1wKoN8NwstoLx7aQ', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
