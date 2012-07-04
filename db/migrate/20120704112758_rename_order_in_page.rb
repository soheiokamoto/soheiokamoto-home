class RenameOrderInPage < ActiveRecord::Migration
  def change
    rename_column :pages, :order, :page_order
  end
end
