module FreeSpacesHelper

  # returns the content of the free space with name 'name' with html tags
  # if the free space is active.
  # used in layouts
  def show_free_space_if_active(name)
    fs = FreeSpace.find_by_name(name)
    if fs.is_active
      fs.content.html_safe # may insert unaltered into output
    else
      ''
    end
  end

  # returns the content of the free space with name 'name' with html tags
  def show_free_space(name)
    fs = FreeSpace.find_by_name(name)
    fs.content.html_safe # may insert unaltered into output
  end
end

