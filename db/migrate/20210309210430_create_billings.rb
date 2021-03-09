class CreateBillings < ActiveRecord::Migration[6.1]
  def change
    create_table :billings do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :street_address
      t.integer :unit
      t.string :city
      t.string :province
      t.string :postal_code
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
