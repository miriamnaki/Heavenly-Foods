class CreateMenuItemCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_item_categories do |t|
      t.references :menu_item
      t.references :category

      t.timestamps
    end
  end
end
