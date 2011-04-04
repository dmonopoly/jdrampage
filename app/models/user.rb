class User < ActiveRecord::Base
  acts_as_authentic
  ROLES = %w[ admin moderator poster ]
	validates_presence_of :role
	
  def self.none?
    count == 0
  end
end