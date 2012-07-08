class Page < ActiveRecord::Base
  attr_accessible :parent_page_id, :title, :url, :filename, :page_order, :visible

  belongs_to :parent_page, class_name: 'Page'
  has_many :child_pages, class_name: 'Page', foreign_key: 'parent_page_id'

  validates :title, presence: true, length: {maximum: 255}
  validates :url, presence: true, length: {maximum: 255}
  validates :filename, presence: true, length: {maximum: 255}
  
  scope :visible_pages, where(visible: true).order(:page_order)
  
  
  def self.visible_child_pages(url)
    begin
      self.find_by_url(url).child_pages.visible_pages
    rescue
      nil
    end
  end
    
  
  def self.visible_sibling_pages(url)
    begin
      self.find_by_url(url).parent_page.child_pages.visible_pages
    rescue
      nil
    end
  end
  
  
  def self.top_level_page(url)
    page = self.find_by_url(url)
    
    if !page.nil?
      while !page.parent_page.nil?
        return page if page.parent_page.url == 'root' 
        page = page.parent_page
      end
    end
    nil
  end  
end
