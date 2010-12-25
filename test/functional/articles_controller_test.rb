require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  context "An article" do
		setup do
			Factory.create(:article, :id => 1, :section => Section.new)
			get :show, :id => 1
		end
		should "show properly" do
			assert_response :success
		end
		should "have an article variable" do
			assert_not_nil assigns(:article)
		end
	end
end
