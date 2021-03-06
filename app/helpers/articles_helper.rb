module ArticlesHelper
  def okay_to_sort_articles?
    Article::ROLES_THAT_CAN_SORT.include?(current_user.role) && ( current_page.nil? || current_page.to_i == 1 )
  end

  # Cleaner way to get the current page as with will_paginate gem
  # Returns nil for first time you navigate to URL with pagination
  # because ?page is not set
  def current_page
    params[:page]
  end

  # Precondition: article id is present
  def current_article
    Article.find(params[:id])
  end

  def article_id_present?
    (params[:controller] == 'articles' || params[:controller] == 'admin/articles') && !params[:id].nil?
  end
end

