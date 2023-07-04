Rails.application.configure do
  # The policies are set in config/environments/[development/test/production].rb

  # Generate random nonce that will be used in <script> and <style> elements
  config.content_security_policy_nonce_generator = -> (request) { SecureRandom.base64(16) }

  # Add the nonce to the Content-Security-Policy header
  config.content_security_policy_nonce_directives = %w(script-src style-src)

  config.content_security_policy do |policy|
    policy.default_src :self
    policy.script_src  :self
    policy.style_src   :self
    policy.connect_src :self
  end
end

