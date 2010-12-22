require 'test_helper'

class PageTest < ActiveSupport::TestCase
	
	should validate_presence_of :title
	should validate_presence_of :body
	
	# the following need additional methods defined in test_helper
	should_act_as_list
end
