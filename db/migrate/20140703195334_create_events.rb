class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.integer :guest_count, null: false
      t.decimal :budget, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
