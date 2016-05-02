class FeedbackMailer < ApplicationMailer
  default to: "allofus@nu.world"

  def feedback_email(email, subject, body)
    @email = email
    @subject = subject
    @body = body
    mail(from: @email, subject: @subject)
  end
end
