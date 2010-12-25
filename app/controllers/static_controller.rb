# This is an ad hoc controller
class StaticController < ApplicationController
	before_filter :require_user, :only => :backside
	layout "application", :only => :home
	layout "backside", :only => :backside
	# frontside homepage
	def home
		@articles = Article.all(:limit => 6)
	end
	
	# backside homepage
	def backside
		@articles = Article.all(:limit => 6)
	end
	
end
