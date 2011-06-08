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
    if !current_article.nil?
      current_article.section.name == section_name
    elsif !current_section.nil?
      current_section.name == section_name
    else # not using sections or articles controller
      false
    end
  end

  def current_layout
    controller.send :_layout # private method... dangerous
  end

  def admin?
    current_layout == 'admin'
  end
end

