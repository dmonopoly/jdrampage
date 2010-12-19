require 'test_helper'

class PageTest < ActiveSupport::TestCase
	
	should_validate_presence_of :title
	should_validate_presence_of :body
	
	# the following need shoulda macros plugin installed first
	should_act_as_list # what about order => 'position'?
end
