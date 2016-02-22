class BetaUsersController < ApplicationController
  layout "beta"

  def landing
  end

  def new
    @beta_user = BetaUser.new
  end

  def create
    create_user(beta_user_params)
  end

  def thanks
  end

  private
  def beta_user_params
    params.require(:beta_user).permit(:first_name, :last_name, :email, :explanation, :communicate)
  end

  def create_user(beta_user_params)
    @beta_user = BetaUser.new(beta_user_params)
    if @beta_user.save
      redirect_to action: :thanks
    else
      flash.now[:error] = @beta_user.errors
      render :new
    end
  end
end
