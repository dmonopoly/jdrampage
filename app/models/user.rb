class User < ActiveRecord::Base
  acts_as_authentic
  ROLES = %w[ admin moderator poster ]
  def self.none?
    count == 0
  end
end