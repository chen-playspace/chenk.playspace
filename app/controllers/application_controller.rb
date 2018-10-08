class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  #This is a method to fetch the info of currently logged in user
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]                   # Note 1
  end

  helper_method :current_user                                                             # Note 2

end






# Note 1:
# We find the currently logged in user in the User model, based on the currently logged in user id which we set in sessions controller (sessions[:user_id]). The if-statement here means we can only do this if the sessions variable exist, which mean there is user who has logged in. We store the current user info in an instance variable @current_user.

# Note 2:
# The current_user method can only be accessible in the controller but we may want to fetch it in the view as well. So we define a helper_method for current_user in the controller here, to turn the current_user method into a helper_method to enable the access from the view. 
