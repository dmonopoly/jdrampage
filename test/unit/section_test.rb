require 'test_helper'

class SectionTest < ActiveSupport::TestCase
	
	context "A section" do
		setup do
			# make sure the test db is already filled; that's why setup is unnecessary
		end
		
		should_have_many :articles
		should_validate_presence_of :name
		
		# the following need additional methods defined in test_helper
		should_act_as_list

		# testing before_destroy...?
	end
	
end