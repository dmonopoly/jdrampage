module ApplicationHelper
	def logged_in? # self-created alias of current_user
		current_user
	end

	# used by backside
	def sidebar? # probably should change this - it doesn't follow rails conventions
		params[:controller] == 'static' ||
		(params[:controller] == 'admin/articles' && params[:action] == 'show') ||
		(params[:controller] == 'admin/pages' && params[:action] == 'show')
	end
end

