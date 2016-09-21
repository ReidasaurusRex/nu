class FeedbackController < ApplicationController
  before_action :get_profile_if_exists
  
  def new
  end

  def create
    FeedbackMailer.feedback_email(params[:email], params[:subject], params[:body]).deliver_later
    redirect_to feedback_thanks_path(subject: params[:subject])
  end

  def thanks
    @subject = params[:subject]
  end

  private
  def get_profile_if_exists
    if @user.profile
      @profile == @user.profile
    end
  end
end
