class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.text :message
      t.integer :amount, null: false
      t.timestamps
    end
    add_index :bids, [:user_id, :event_id]
  end
end
