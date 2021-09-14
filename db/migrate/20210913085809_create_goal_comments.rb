class CreateGoalComments < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_comments do |t|
      t.text :customer_comment
      t.integer :customer_id,       null: false, default: ""
      t.integer :goal_id,           null: false, default: ""

      t.timestamps
    end
  end
end
