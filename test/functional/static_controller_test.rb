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
		
		should "load properly" do
			assert_response :success
			assert_template :home
		end
		
		should "use the correct layout" do
			#assert_layout 'application'
			puts "--#{@response.layout}---"
			assert_equal 'application', @response.layout
			#assert_not_layout 'backside'
		end
		
		should "have articles available" do
			assert_not_nil assigns(:articles)
		end
	end
	
	context "The backside home page" do
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
			
			should "not be accessible" do
				assert_response :error
			end
		end
		
		context "after someone logs in" do
			setup do
				activate_authlogic
				UserSession.create(:login => "someone", :password => "my password")
				get :backside
			end
			
			should "load properly" do
				assert_response :success
				assert_template :backside
			end
			
			should "use the correct layout" do
				#assert_layout 'backside'
				puts "--#{@response.layout}"
				assert_equal 'backside', @response.layout
				#assert_not_layout 'application'
			end
			
			should "have articles available" do
				assert_not_nil assigns(:articles)
			end
		end
		
	end
end
