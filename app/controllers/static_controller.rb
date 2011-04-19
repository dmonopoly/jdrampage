# This is an ad hoc controller
class StaticController < ApplicationController
	before_filter :require_user, :only => :admin_home

	# front homepage
	def home
		@articles = Article.all(:order => :position, :limit => 6)
		render :layout => 'application'
	end

	# back homepage
	def admin_home
		@articles = Article.all(:limit => 6)
		render :layout => 'admin'
	end

end

