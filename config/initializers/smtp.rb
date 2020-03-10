ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'for-the-gamers.herokuapp.com/',
  user_name: ENV['lucifer87'],
  password: ENV['bigboss1988'],
  authentication: :login,
  enable_starttls_auto: true
}
