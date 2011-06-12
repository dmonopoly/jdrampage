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

  # Returns true if current section should be highlighted; used globally.
  # A section is only selected if one of the following controller/actions is active:
  #   articles/show, admin/articles/edit
  #   sections/show, admin/sections/show, admin/sections/edit
  # Basically, whenever article id OR section id is available
  def section_selected?(section_name)
    if article_id_present?
      current_article.section.name == section_name
    elsif section_id_present?
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

