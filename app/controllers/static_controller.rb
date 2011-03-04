# This is an ad hoc controller
class StaticController < ApplicationController
	before_filter :require_user, :only => :backside

	# front homepage
	def home
		@articles = Article.all(:limit => 6)
		render :layout => 'application'
	end

	# back homepage
	def backside
		@articles = Article.all(:limit => 6)
		render :layout => 'backside'
	end

end

