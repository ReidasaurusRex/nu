class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    create_user(new_user_params)
  end

  def show
  end

  def edit
  end

  def edit_password
  end

  def update
    update_user(edit_user_params)
  end

  def update_password
    update_user_password(password_params)
  end

  def destroy
  end

  private
  def new_user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def edit_user_params
    params.require(:user).permit(:email, :password)
  end

  def password_params
    params.require(:password).permit(:current, :new, :confirm_new)
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

  def update_user(user_params)
    if @user.update(user_params)
      flash[:success] = "Updated account!"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def update_user_password(password_params)
    if password_params[:current]
      authentic_user = @user.authenticate(password_params[:current])
      if authentic_user
        if !password_params[:new].empty? && !password_params[:confirm_new].empty?
          if password_params[:new] == password_params[:confirm_new]
            @user.update(password: password_params[:new])
            flash[:success] = "Updated password"
            redirect_to root_path
          else
            flash.now[:new_password] = "Password confirmation doesn\'t match"
            flash.now[:confirm_new_password] = "Password confirmation doesn\'t match"  
            render :edit_password
          end
        else
          flash.now[:new_password] = "Please enter a new and confirming password"
          flash.now[:confirm_new_password] = "Please enter a new and confirming password"
          render :edit_password
        end
      else
        flash.now[:current_password] = "Current password doesn\'t match"
        render :edit_password
      end
    else
      flash.now[:current_password] = "Please enter your current password"
      render :edit_password
    end
  end
end
