class SessionsController < ApplicationController
  def new
  
  end

  def create
    user = User.find_by_email(params[:email])                                         # Note 1
    if user && user.authenticate(params[:password])                                   # Note 2
      session[:user_id] = user.id                                                     # Note 3 
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  def tictactoe

  end

end



# Note 1:
# To find in user model by the email keyed-in by user in login page

# Note 2:
# If user matching the email was found AND password keyed-in by user in login page, matches the password of user found. We use the authenticate method provided by has_secure_password to check against password keyed-in by user in login page

# Note 3:
# To log user in - by storing user id in the session, for setting session in order to indicate current_user being the person logged in