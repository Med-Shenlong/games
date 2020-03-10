ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'for-the-gamers.herokuapp.com/',
  user_name: ENV['SENDGRID_username'],
  password: ENV['SENDGRID_password'],
  authentication: :login,
  enable_starttls_auto: true
}
