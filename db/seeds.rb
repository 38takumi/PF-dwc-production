# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

goal = Goal.create!(customer_id: 1, goal_title: '確認！',goal_description: '確認！')

1500.times do |number|
  GoalComment.create!(customer_id: 1, goal_id: goal.id, customer_comment: '確認！')
end