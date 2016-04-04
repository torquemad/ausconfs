class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :require_identical_user, only: [:edit, :update]

  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created"
      session[:user_id] = @user.id
      redirect_to conferences_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Account updated"
      redirect_to edit_user_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_identical_user
    if current_user != @user
      flash[:danger] = "You cannot edit that."
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
