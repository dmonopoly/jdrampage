module ApplicationHelper
	def logged_in? # self-created alias of current_user
		current_user
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