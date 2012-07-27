class InsertGitBasicGuideOnWindowsToPage < ActiveRecord::Migration
  def up
    blog = Page.find_by_url('blog')
    
    Page.create(parent_page_id: blog.id, title: 'Git Basic Guide (on Windows)', filename: 'git_basic_guide_on_windows', url: 'git-basic-guide-on-windows', page_order: 1, visible: true) if !blog.nil?
  end

  def down
    Page.delete_all(url: 'git-basic-guide-on-windows')
  end
end
