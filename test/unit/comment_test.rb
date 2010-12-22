require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	
	context "A comment" do
		setup do
			# make sure the test db is already filled; that's why setup is unnecessary
		end
		
		should belong_to :article
		should validate_presence_of :body
		should validate_presence_of :full_name
		should validate_presence_of :email
		should validate_format_of(:email).with("someone123@somewhere.com")

	end
	
end
