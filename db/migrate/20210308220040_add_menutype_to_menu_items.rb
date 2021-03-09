class AddMenutypeToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :menu_items, :menutype, null: false, foreign_key: true
  end
end
