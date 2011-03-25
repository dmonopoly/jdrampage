# Applies to all controllers in the admin namespace
class AdminController < ApplicationController
	layout "admin"
	before_filter :require_user # method defined in ApplicationController
end

