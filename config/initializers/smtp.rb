ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
<<<<<<< HEAD
  domain: 'for-the-gamers.herokuapp.com',
  user_name: ENV['lucifer87'],
  password: ENV['bigboss1988'],
=======
  domain: 'http://for-the-gamers.herokuapp.com/',
  user_name: ENV['******'],
  password: ENV['******'],
>>>>>>> 0f294256dc408575d55de7b454478abe04e01382
  authentication: :login,
  enable_starttls_auto: true
}
