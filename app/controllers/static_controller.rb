# This is an ad hoc controller
class StaticController < ApplicationController
	before_filter :require_user, :only => :admin_home

	# front homepage
	def home
		@articles = Article.all(:order => :position, :limit => 6)
	end

	# back homepage
	def admin_home
		render :layout => 'admin' # needed, or else on the front (with sidebars)
	end

	# staff page
	def staff
		@users = User.all
	end

	# search page
	def search_page
  end

end

