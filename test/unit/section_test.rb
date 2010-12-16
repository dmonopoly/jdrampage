require 'test_helper'

class SectionTest < ActiveSupport::TestCase
	
	should_have_many :articles
	should_validate_presence_of :name
	
	# the following need shoulda macros plugin installed first
	should_act_as_list # what about order => 'position'?

	# need to test before_destroy...
end
