class InsertDevelopingRubyOnRailsApplicationForHerokuToPage < ActiveRecord::Migration
  def up
    blog = Page.find_by_url('blog')
    
    Page.create(parent_page_id: blog.id, title: 'Developing Ruby on Rails Application for Heroku', filename: 'developing_ruby_on_rails_application_for_heroku', url: 'developing-ruby-on-rails-application-for-heroku', page_order: 2, visible: true) if !blog.nil?
  end

  def down
    Page.delete_all(url: 'developing-ruby-on-rails-application-for-heroku')
  end
end
