module RegistrationHelper
  def current_user_signed_in?
    !session[:user_id].nil?
  end

  def current_current_user
    User.find(session[:user_id])
  end
end
