require 'test_helper'

class SectionTest < ActiveSupport::TestCase	
	context "A section" do
		should have_many :articles
		should validate_presence_of :name
		
		# the following need additional methods defined in test_helper
		should_act_as_list

		# testing before_destroy...?
	end
end