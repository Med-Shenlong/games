class ApplicationMailer < ActionMailer::Base
  def message
    @user = params[:user]
    mail(
        subject: 'It worked!',
        to: @user.email,             # set this to the email you verified with Postmark when testing
        from: 'shenlong@tekken.',     # use the email you verified with Postmark

        track_opens: 'true'          # as easy as that
    )
  end
end
