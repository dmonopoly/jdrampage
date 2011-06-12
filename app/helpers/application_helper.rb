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

  # returns true if current section should be highlighted; used globally
  def section_selected?(section_name)
    # a section is only selected if one of the following controller/actions is active:
    # articles/show
    # sections/show
    # admin/sections/show
    if params[:controller] == 'articles' && params[:action] == 'show'
      current_article.section.name == section_name
    elsif (params[:controller] == 'sections' || params[:controller] == 'admin/sections') && params[:action] == 'show'
      current_section.name == section_name
    else # none of the necessary controllers/actions is active
      false
    end
  end

  # returns the current layout, but fails if render :layout is used in the controller
  def current_layout
    controller.send :_layout # private method
  end

  # returns true if the current layout is admin
  # not that elegant because you have one exception: admin_home
  def admin?
    current_layout == 'admin' || (params[:controller] == 'static' && params[:action] == 'admin_home')
  end
end

