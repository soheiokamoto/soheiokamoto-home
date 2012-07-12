class InsertProjectCodeBlogToPage < ActiveRecord::Migration
  def up
    root = Page.find_by_url('root')
    about_me = Page.find_by_url('about-me')
    links = Page.find_by_url('links')
    
    Page.create(parent_page_id: about_me.id, title: 'Projects', filename: 'projects', url: 'projects', page_order: 2, visible: true) if !about_me.nil?
    Page.create(parent_page_id: root.id, title: 'Code', filename: 'code', url: 'code', page_order: 1, visible: true)
    Page.create(parent_page_id: root.id, title: 'Blog', filename: 'blog', url: 'blog', page_order: 2, visible: true)
    links.update_attributes!(page_order: 3) if !links.nil?
  end

  def down
    links = Page.find_by_url('links')
    
    Page.delete_all(url: 'projects')
    Page.delete_all(url: 'code')
    Page.delete_all(url: 'blog')
    links.update_attributes!(page_order: 1) if !links.nil?
  end
end
