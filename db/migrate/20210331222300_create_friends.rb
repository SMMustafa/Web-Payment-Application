class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.text :name
      t.text :email
      t.integer :user_id

      t.timestamps
    end
  end
end
