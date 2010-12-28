require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  context "A section" do
		setup do
			@section = Factory.create(:section)
		end
		should respond_with :success
	end
end
