class Goal < ApplicationRecord
 belongs_to :customer
 has_many :goal_comments, dependent: :destroy
 has_many :favorites, dependent: :destroy

 # いいねを押したcustomer.idを全て取得、条件に当てはまるかどうか
 def favorited_by?(customer)
   favorites.where(customer_id: customer.id).exists?
   # favorites.exists?(customer_id: customer.id)
 end

 # 検索機能　ここから
 def self.search(search, word)
  if search == "forward_match"
   @goal = Goal.where("goal_title LIKE?","#{word}%")
  elsif search == "backward_match"
    @goal = Goal.where("goal_title LIKE?","%#{word}")
  elsif search == "perfect_match"
    # @goal = Goal.where("#{word}")
    @goal = Goal.where(goal_title: word)
  elsif search == "partial_match"
    @goal = Goal.where("goal_title LIKE?","%#{word}%")
  else
    @goal = Goal.all
  end
 end
 # 検索機能　ここまで


 validates :goal_title, presence: true

 validates :goal_description, presence: true
 validates :goal_description, length: { maximum: 200 }
end
