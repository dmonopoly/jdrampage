module FreeSpacesHelper

  # Used on front
  def show_free_space_if_active(name)
    fs = FreeSpace.find_by_name(name)
    if fs.is_active
      # This partial actually renders the admin partial and then adds a '>>' link
      render :partial => "free_spaces/show", :locals => { :free_space => fs }
    end
  end

  # Used on back
  def show_free_space(name)
    fs = FreeSpace.find_by_name(name)
    render :partial => "admin/free_spaces/partials/show", :locals => { :free_space => fs }
  end
end

