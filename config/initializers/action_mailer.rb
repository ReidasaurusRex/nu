Rails.application.configure do
  config.action_mailer.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :user_name => ENV["mandrill_username"],
    :password  => ENV["mandrill_api_key"],
    :domain => 'nu.world'
  }
end