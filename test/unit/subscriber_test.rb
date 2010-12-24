require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  context "A subscriber" do
		setup do
			@subscriber = Factory(:subscriber)
		end
		
		should validate_presence_of :email
		should validate_uniqueness_of :email # requires a record in the db
		
		# testing format of email
		should allow_value('someone@somewhere.com').for :email
		should_not allow_value('someonesomewhere.com').for :email
	end
end
