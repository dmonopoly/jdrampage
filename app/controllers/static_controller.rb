# This is an ad hoc controller
class StaticController < ApplicationController
	before_filter :require_user, :only => :backside_home
	layout 'backside', :only => :backside_home
	# backside home
	def backside_home
	end
	
end
