class InsertExperiencePublicationsLinksPagesToPage < ActiveRecord::Migration
  def up
    root = Page.find_by_url('root')
    
    Page.create(parent_page_id: root.id, title: 'Experience', filename: 'experience', url: 'experience', page_order: 1, visible: true)
    Page.create(parent_page_id: root.id, title: 'Publications', filename: 'publications', url: 'publications', page_order: 2, visible: true)
    Page.create(parent_page_id: root.id, title: 'Links', filename: 'links', url: 'links', page_order: 3, visible: true)
  end

  def down
    Page.delete_all(url: 'experience')
    Page.delete_all(url: 'publications')
    Page.delete_all(url: 'links')
  end
end
