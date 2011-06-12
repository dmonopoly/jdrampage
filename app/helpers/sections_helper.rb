module SectionsHelper
  # Precondition: section id is present
  def current_section
    Section.find(params[:id])
  end

  def section_id_present?
    (params[:controller] == 'sections' || params[:controller] == 'admin/sections') && !params[:id].nil?
  end
end

