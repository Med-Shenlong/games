ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'for-the-gamers.herokuapp.com/',
  user_name: ENV['SENDGRID_lucifer87'],
  password: ENV['SENDGRID_bigboss1988'],
  authentication: :login,
  enable_starttls_auto: true
}
