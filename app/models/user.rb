class User < ActiveRecord::Base
  acts_as_authentic
  ROLES = %w[ superadmin admin moderator poster ]
	LIMITED_ROLES = %w[ admin moderator poster ]
	validates_presence_of :role
	validates_uniqueness_of :login, :full_name, :email
	
  def self.none?
    count == 0
  end
end