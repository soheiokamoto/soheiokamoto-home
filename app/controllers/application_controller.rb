class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :visible_child_pages, :visible_ancestor_pages, :visible_sibling_pages, :top_level_url

  def visible_child_pages(url = 'root')
    Page.visible_child_pages(url)
  end
  
  def visible_sibling_pages(url = 'root')
    Page.visible_sibling_pages(url)
  end
  
  def visible_ancestor_pages(url)
    pages = Array.new
    
    page = Page.find_by_url(url)
    while !page.nil? && page.url != 'root' 
      pages << page
      page = page.parent_page
    end
    
    pages.reverse
  end
  
  def top_level_url
    if !defined? @top_level_url
      top_level_page = Page.top_level_page(params[:url])
      
      if !top_level_page.nil?
        @top_level_url = top_level_page.url
      else
        @top_level_url = nil
      end
    end
    
    @top_level_url
  end
end
