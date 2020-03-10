ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'http://for-the-gamers.herokuapp.com/',
  user_name: ENV['******'],
  password: ENV['******'],
  authentication: :login,
  enable_starttls_auto: true
}
