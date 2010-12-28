require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  context "A page" do
		setup do
			@page = Factory.create(:page)
		end
		should respond_with :success
		should "have @page available" do
			assert_not_nil assigns(:page)
		end
	end
end
