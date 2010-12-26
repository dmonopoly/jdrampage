# This is an ad hoc controller
class StaticController < ApplicationController
	before_filter :require_user, :only => :backside
	
	# frontside homepage
	def home
		@articles = Article.all(:limit => 6)
		render :layout => 'application'
	end
	
	# backside homepage
	def backside
		@articles = Article.all(:limit => 6)
		render :layout => 'backside'
	end
	
end
