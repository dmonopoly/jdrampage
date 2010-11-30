# This is an ad hoc controller
class StaticController < ApplicationController
	before_filter :require_user
	layout 'backside'
	
	# backside home
	def index
	end
	
end
