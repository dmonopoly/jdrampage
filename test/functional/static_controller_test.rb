require 'test_helper'

class StaticControllerTest < ActionController::TestCase
	context "The home page" do
		setup do 
			2.times { Factory.create(:section) }
			Section.all.each { |section|
				5.times { Factory.create(:article, :section => section) }
			}
			get :home
		end
		should respond_with :success
		should render_template 'static/home'
		should render_with_layout 'application'
		should "have articles available" do
			assert_not_nil assigns(:articles)
		end
	end
	
	context "The backside home page" do # maybe you're getting into integration tests?
		setup do
			2.times { Factory.create(:section) }
			Section.all.each { |section|
				5.times { Factory.create(:article, :section => section) }
			}
		end
		context "without someone logging in" do
			setup do
				get :backside
			end
			should "redirect to home page" do
				assert_response :redirect
				assert_template :home
			end
			should respond_with :redirect
			should render_template 'static/home'
			should set_the_flash
		end
		
		context "after someone logs in" do
			setup do
				activate_authlogic
				UserSession.create(:login => "someone", :password => "my password")
				get :backside
			end
			should respond_with :redirect
			should render_template 'static/backside'
			should render_with_layout 'backside'
			should "have @articles available" do
				assert_not_nil assigns(:articles)
			end
		end
		
	end
end
