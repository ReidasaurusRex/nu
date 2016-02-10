class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_one :privacy_setting, dependent: :destroy
  has_one :notification_setting, dependent: :destroy
  has_one :email_setting, dependent: :destroy
  has_secure_password

  validates :email, presence: {message: "Email is required"}
  validates :password, presence: {message: "Password is required"}
  validates_confirmation_of :password, message: "Must match password"
end
