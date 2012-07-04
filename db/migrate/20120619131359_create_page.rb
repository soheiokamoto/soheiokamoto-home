class CreatePage < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :parent_page_id
      t.string :title
      t.string :filename
      t.boolean :visible

      t.timestamps
    end
  end
end
