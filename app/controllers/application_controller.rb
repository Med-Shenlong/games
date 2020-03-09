class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action  :only_signed_in
  add_flash_types :success, :danger
  helper_method :current_user, :user_signed_in?


private

def only_signed_in

  if !user_signed_in?
    redirect_to new_user_path, danger: "You don\'t have permission to access this page"

  end
end


def only_signed_out


redirect_to profil_path if user_signed_in?

end



def user_signed_in?

  !current_user.nil?

end

# retrurn the connected user

def current_user

return nil if !session[:auth] || !session[:auth]['id']

return @_users if @_users

@_users = User.find_by_id(session[:auth]['id'])

end
 end
