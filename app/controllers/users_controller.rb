class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    create_user(user_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(session[:user_id])
  end

  def create_user(user_params)
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Bangers and mash!"
      redirect_to new_user_profile_path(@user)
    else
      render :new
    end
  end
end
