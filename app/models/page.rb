class Page < ActiveRecord::Base
  attr_accessible :parent_page_id, :title, :url, :filename, :page_order, :visible

  belongs_to :parent_page, class_name: 'Page'
  has_many :child_pages, class_name: 'Page', foreign_key: 'parent_page_id'

  validates :title, presence: true, length: {maximum: 255}
  validates :url, presence: true, length: {maximum: 255}
  validates :filename, presence: true, length: {maximum: 255}
end
