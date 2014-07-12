class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.text :body, null: false
      t.timestamps
    end
    add_index :messages, [:sender_id, :receiver_id]
  end
end
