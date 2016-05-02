class Mailers::FeedbackMailer < ApplicationMailer
  default to: "allofus@nu.world"

  def feedback_email(feedback)
    @feedback = feedback
    mail(from: @feedback.email, subject: @feedback.subject)
  end
end
