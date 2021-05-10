class UpdatePayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :sender_id, :integer
    add_column :payments, :recipient_id, :integer
    remove_column :payments, :user_id 
    remove_column :payments, :recipient_name 
    remove_column :payments, :recipient_email 
  end
end
