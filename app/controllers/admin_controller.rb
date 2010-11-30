# Applies to all controllers in the admin namespace
class AdminController < ApplicationController
	layout "backside"
	before_filter :require_user # method defined in ApplicationController
end