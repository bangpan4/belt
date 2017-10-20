class SessionsController < ApplicationController
    def create
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to "/groups"
        else 
            flash[:errors] = ["Invalid Combination"]
            redirect_to "/"
    end
  end

  def destroy
    reset_session
    redirect_to "/"
  end
end
