class GoalComment < ApplicationRecord
  belongs_to :customer
  belongs_to :goal

  validates :customer_comment, presence: true
end