class UserMailer < ApplicationMailer

def confirm (user)

  @user = user


  mail(to: user.email, subject: 'votre inscription sur le site ' + Rails.application.config.site[:name])


end


def password(user)

  @user = user


  mail(to: user.email, subject: 'Reset Password ' + Rails.application.config.site[:name])

end

end
