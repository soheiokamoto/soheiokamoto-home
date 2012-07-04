class InsertPagesToPage < ActiveRecord::Migration
  def up
    root = Page.create(title: 'root', filename: 'root', url: 'root', page_order: 0, visible: false)
    Page.create(parent_page_id: root.id, title: 'Home', filename: 'home', url: 'home', page_order: 0, visible: true)
  end

  def down
    Page.delete_all(url: 'root')
    Page.delete_all(url: 'Home')
  end
end
