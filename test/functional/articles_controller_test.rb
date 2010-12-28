require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  context "An article" do
		setup do
			@article = Factory(:article)
			puts "---#{Article.first.id}---"
			get :show, :id => Article.first.id
		end
		should respond_with :success
		should "have an article variable" do
			assert_not_nil assigns(:article)
		end
	end
end
