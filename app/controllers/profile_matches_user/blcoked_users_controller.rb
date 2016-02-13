class BlockedUsersController < ApplicationController
  before_action :get_profile_from_profile_id
  before_action :get_blocked_users, only: :index
  before_action :get_blocked_user, only: :destroy

  def index
  end

  def create
  end

  def destroy
  end

  private
  def get_blocked_users
    @blocked_users = @profile.blocked_users
  end

  def get_blocked_user
    @blocked_user = BlockedUser.find(params[:id])
  end
end
