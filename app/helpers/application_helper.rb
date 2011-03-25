module ApplicationHelper
	def logged_in? # self-created alias of current_user
		current_user
	end

	# used by the back; probably should refactor w/content_for
	def sidebar? # probably should change this - it doesn't follow rails conventions
		params[:controller] == 'static' ||
		(params[:controller] == 'admin/articles' && params[:action] == 'show') ||
		(params[:controller] == 'admin/pages' && params[:action] == 'show')
	end

	# used by free spaces index
	def yes_or_no(boolean)
	  if boolean
	    'Yes'
    else
      'No'
    end
  end
end

