class InsertRootToPages < ActiveRecord::Migration
  def up
    Page.create(:title => 'root', :filename => 'root')
  end

  def down
    Page.delete_all(:title => 'root')
  end
end
