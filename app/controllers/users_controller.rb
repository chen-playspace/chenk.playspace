class UsersController < ApplicationController

    #To create user (Get request - will direct to the sign up form)
    def new
      @user = User.new
    end
    
    #To create user (Post request - will save user to the database)
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id                                                  # Note 1
        redirect_to root_url, notice: "Thank you for signing up!"
      else
        render "new"
      end
    end

    def home

    end
    

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)         #CK Note: (:user) - refers to user model
    end

end



# Note 1
# Once user successfully signed up, we logged the user in automatically. This is done by assiging user's id to the session variable (same as Code Line 9 in sessions controller).