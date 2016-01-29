class User < ActiveRecord::Base
  has_one :profile
  has_one :privacy_setting
  has_one :notification_setting
  has_one :email_setting
end
