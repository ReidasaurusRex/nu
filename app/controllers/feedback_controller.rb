class FeedbackController < ApplicationController
  def new
  end

  def create
    FeedbackMailer.feedback_email(params[:email], params[:subject], params[:body]).deliver_later
    redirect_to feedback_thanks_path(subject: params[:subject])
  end

  def thanks
    @subject = params[:subject]
  end
end
