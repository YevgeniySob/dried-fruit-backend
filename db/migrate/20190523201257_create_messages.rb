class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :user_id
      t.integer :chatroom_id
      t.integer :likes, default: 0
      t.timestamps
    end
  end
end
