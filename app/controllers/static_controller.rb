# This is an ad hoc controller
class StaticController < ApplicationController
	before_filter :require_user, :only => :index
	layout 'backside', :only => :index
	# backside home / control panel
	def index
	
	end
	
end
