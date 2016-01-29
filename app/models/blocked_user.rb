class BlockedUser < ActiveRecord::Base
  belongs_to :profile
end
