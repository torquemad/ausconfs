class UsersController < ApplicationController

  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created"
      redirect_to conferences_path
    else
      render 'new'
    end
  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
