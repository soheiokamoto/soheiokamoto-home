class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :navigation_menus

  def navigation_menus
    #Page.find_by_title('root').child_pages.where(:visible => true).order(:page_order)
    begin
      Page.find_by_title('root').child_pages.where(:visible => true).order(:page_order)
    rescue
      []
    end
  end

end
