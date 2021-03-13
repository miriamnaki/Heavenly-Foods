class Transactions < ActiveRecord::Migration[6.1]

  def change
    create_table :transactions do |t|
      t.integer :total
      t.references :user
      t.jsonb :menu_items
      t.timestamps 
    end


  end
end
