module FreeSpacesHelper

  # Returns the content of the free space with name 'name' with html tags
  # and a link to the back if the free space is active
  # Used on front layout
  def show_free_space_if_active(name)
    fs = FreeSpace.find_by_name(name)
    if fs.is_active
      fs.content.html_safe # may insert unaltered into output
      # insert html link somehow...
    else
      ''
    end
  end

  # Returns the content of the free space with name 'name' with html tags
  # Used on back
  def show_free_space(name)
    fs = FreeSpace.find_by_name(name)
    fs.content.html_safe # may insert unaltered into output
  end
end

