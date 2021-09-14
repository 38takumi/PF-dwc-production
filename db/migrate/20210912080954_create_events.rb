class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_title,        null: false, default: ""
      t.text :event_description
      t.datetime :event_start,      null: false, default: ""
      t.datetime :event_end,        null: false, default: ""

      t.integer :customer_id,       null: false

      t.timestamps
    end
  end
end
