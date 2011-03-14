module FreeSpacesHelper

  # returns the content of the free space with name 'name'
  # if the free space is active
  def show_free_space_if_active(name)
    fs = FreeSpace.find_by_name(name)
    if fs.is_active
      fs.content
    else
      ''
    end
  end
end

