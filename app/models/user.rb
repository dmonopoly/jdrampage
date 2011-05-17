class User < ActiveRecord::Base
	ROLES = %w[ superadmin admin moderator poster ]
	LIMITED_ROLES = %w[ admin moderator poster ]

	has_attached_file :photo, :default_url=>"/system/photos/original/missing.png",
										:styles => { :thumb => "100x100" }
	acts_as_authentic
	validates_presence_of :role
	validates_uniqueness_of :login, :full_name, :email

  def self.none?
    count == 0
  end
end

