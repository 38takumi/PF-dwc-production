class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :goal

  validates_uniqueness_of :goal_id, scope: :customer_id
end