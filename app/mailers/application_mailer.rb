class TestMailer < ActionMailer::Base
  def hello
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'shenlong@tekken.fr',
      :from => 'shenlong@tekken.fr',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end
