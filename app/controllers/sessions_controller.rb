class SessionsController < ApplicationController

  def new
  end
 
  def create
   user = User.find_by(email: params[:email])
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     flash[:success] = "Logged in"
     redirect_to conferences_path

   else
     flash.now[:danger] = "Invalid email address or password"
     render 'new'
   end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to conferences_path
  end

end
