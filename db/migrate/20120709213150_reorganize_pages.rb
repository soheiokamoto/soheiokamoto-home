class ReorganizePages < ActiveRecord::Migration
  def up
    home = Page.find_by_url('home')
    experience = Page.find_by_url('experience')
    publications = Page.find_by_url('publications')
    
    home.update_attributes!(title: 'About Me', filename: 'about_me', url: 'about-me') if !home.nil?
    experience.update_attributes!(parent_page_id: home.id, title: 'Work Experience', filename: 'work_experience', url: 'work-experience') if !experience.nil?
    publications.update_attributes!(parent_page_id: home.id) if !publications.nil?
  end

  def down
    root = Page.find_by_url('root')
    about_me = Page.find_by_url('about-me')
    experience = Page.find_by_url('experience')
    publications = Page.find_by_url('publications')
    
    about_me.update_attributes!(title: 'Home', filename: 'home', url: 'home') if !about_me.nil?
    experience.update_attributes!(parent_page_id: root.id, title: 'Experience', filename: 'experience', url: 'experience') if !experience.nil?
    publications.update_attributes!(parent_page_id: root.id) if !publications.nil?
  end
end
