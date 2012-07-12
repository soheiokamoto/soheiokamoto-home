class ReorganizePages < ActiveRecord::Migration
  def up
    home = Page.find_by_url('home')
    experience = Page.find_by_url('experience')
    publications = Page.find_by_url('publications')
    links = Page.find_by_url('links')
    
    home.update_attributes!(title: 'About Me', filename: 'about_me', url: 'about-me') if !home.nil?
    experience.update_attributes!(parent_page_id: home.id, title: 'Work Experience', filename: 'work_experience', url: 'work-experience', page_order: 0) if !experience.nil?
    publications.update_attributes!(parent_page_id: home.id, page_order: 1) if !publications.nil?
    
    links.update_attributes!(page_order: 1) if !links.nil?
  end

  def down
    root = Page.find_by_url('root')
    about_me = Page.find_by_url('about-me')
    experience = Page.find_by_url('experience')
    publications = Page.find_by_url('publications')
    links = Page.find_by_url('links')
    
    about_me.update_attributes!(title: 'Home', filename: 'home', url: 'home') if !about_me.nil?
    experience.update_attributes!(parent_page_id: root.id, title: 'Experience', filename: 'experience', url: 'experience', page_order: 2) if !experience.nil?
    publications.update_attributes!(parent_page_id: root.id, page_order: 3) if !publications.nil?
    links.update_attributes!(page_order: 4) if !links.nil?
  end
end
