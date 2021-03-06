class SessionsController < ApplicationController


skip_before_action :only_signed_in, only: [:new, :create]
before_action :only_signed_out , only: [:new, :create]


  def new



  end

  def create


user_params = params.require(:user)

@user = User.where('confirmed = true AND (username = :username OR email = :username)', username: user_params[:username]).first

if @user and @user.authenticate(user_params[:password])


session[:auth] = @user.to_session
redirect_to profil_path, success: 'Well done! You successfully joined our community.'
else

  redirect_to new_session_path, danger: 'Oh snap! Change a few things up and try submitting again.'

  end
end


  def destroy


    session.destroy
    redirect_to new_session_path, success: 'you have been disconnected'
  end
end
