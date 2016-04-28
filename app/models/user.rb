class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_one :privacy_setting, dependent: :destroy
  has_one :notification_setting, dependent: :destroy
  has_one :email_setting, dependent: :destroy
  has_secure_password(validations: false)

  validates :email, presence: {message: " is required"}
  validates :password, presence: {message: " is required"}
  validates :password, confirmation: {message: " must match"}

  after_create :send_welcome_email_to_user

  def send_welcome_email_to_user
    UserMailer.welcome_email(self).deliver_later
  end
end
