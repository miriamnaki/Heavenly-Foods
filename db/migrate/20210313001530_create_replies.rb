class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.references :review
      t.references :user
      t.text :message

      t.timestamps
    end
  end
end
