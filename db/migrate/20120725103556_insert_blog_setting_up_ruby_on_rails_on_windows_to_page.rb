class InsertBlogSettingUpRubyOnRailsOnWindowsToPage < ActiveRecord::Migration
  def up
    blog = Page.find_by_url('blog')
    
    Page.create(parent_page_id: blog.id, title: 'Setting Up Ruby on Rails on Windows', filename: 'setting_up_ruby_on_rails_on_windows', url: 'setting-up-ruby-on-rails-on-windows', page_order: 0, visible: true) if !blog.nil?
  end

  def down
    Page.delete_all(url: 'setting-up-ruby-on-rails-on-windows')
  end
end
