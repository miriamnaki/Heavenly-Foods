class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :first_name
      t.string :last_name
      t.integer :card_number
      t.date :expiry_date
      t.integer :security_code

      t.timestamps
    end
  end
end
