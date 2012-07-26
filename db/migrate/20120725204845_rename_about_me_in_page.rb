class RenameAboutMeInPage < ActiveRecord::Migration
  def up
    about_me = Page.find_by_url('about-me')
    
    about_me.update_attributes!(title: 'About', filename: 'about', url: 'about') if !about_me.nil?
  end

  def down
    about = Page.find_by_url('about')
    
    about.update_attributes!(title: 'About Me', filename: 'about_me', url: 'about-me') if !about.nil?
  end
end
