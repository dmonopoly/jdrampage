class CreateUsers < ActiveRecord::Migration
  def self.up
		create_table :users do |t|
			# Basic necessities (note that :null is really "null_allowed")
			t.string 		:login								:null => false
			t.string 		:full_name
			t.string    :email,               :null => false
			t.string    :crypted_password,    :null => false
			t.string    :password_salt,       :null => false # recommended
			t.string    :persistence_token,   :null => false # required
			t.string    :single_access_token, :null => false
			t.string    :perishable_token,    :null => false

			t.timestamps
			
			# Magic columns - automatically maintained by Authlogic if they are present
			t.integer   :login_count,         :null => false, :default => 0
			t.integer   :failed_login_count,  :null => false, :default => 0
			t.datetime  :last_request_at
			t.datetime  :current_login_at
			t.datetime  :last_login_at
			t.string    :current_login_ip
			t.string    :last_login_ip
		end
  end

  def self.down
  end
end
