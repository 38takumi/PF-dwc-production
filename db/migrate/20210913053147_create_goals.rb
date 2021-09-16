class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string      :goal_title,        null: false
      t.text        :goal_description,  null: false
      # t.datetime    :goal_month,        null: false
      #t.datetime:goal_startnull
      #t.datetime:goal_endnull
      t.integer     :customer_id,       null: false

      t.timestamps
    end
  end
end
