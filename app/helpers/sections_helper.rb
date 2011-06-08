module SectionsHelper
  def current_section
    if params[:controller] == 'sections' || params[:controller] == 'admin/sections'
      Section.find(params[:id])
    else
      nil
    end
  end
end

