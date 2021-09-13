class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string      :goal_title
      t.text        :goal_description
      t.datetime    :goal_start
      t.datetime    :goal_end
      t.integer     :customer_id

      t.timestamps
    end
  end
end
