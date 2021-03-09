class CreateMenutypes < ActiveRecord::Migration[6.1]
  def change
    create_table :menutypes do |t|
      t.string :menutype
      

      t.timestamps
    end
  end
end
