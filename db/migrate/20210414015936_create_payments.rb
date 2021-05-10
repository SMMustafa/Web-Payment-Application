class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.text :recipient_name
      t.text :recipient_email
      t.float :amount
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
