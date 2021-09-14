class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string      :goal_title,        null: false, default: ""
      t.text        :goal_description,  null: false, default: ""
      t.datetime    :goal_start,        null: false, default: ""
      t.datetime    :goal_end,          null: false, default: ""
      t.integer     :customer_id,       null: false, default: ""

      t.timestamps
    end
  end
end
