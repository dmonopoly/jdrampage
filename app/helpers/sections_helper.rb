module SectionsHelper
  # Precondition: section id is present
  def current_section
    Section.find(params[:id])
  end
end

