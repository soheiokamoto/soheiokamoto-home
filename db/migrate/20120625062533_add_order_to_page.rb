class AddOrderToPage < ActiveRecord::Migration
  def change
    add_column :pages, :order, :integer
  end
end
