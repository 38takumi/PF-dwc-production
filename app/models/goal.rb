class Goal < ApplicationRecord
 belongs_to :customer
 has_many :goal_comments, dependent: :destroy
 has_many :favorites, dependent: :destroy

 def favorited_by?(customer)
   # いいねを押したcustomer.idを全て取得、条件に当てはまるかどうか
   favorites.where(customer_id: customer.id).exists?
   # favorites.exists?(customer_id: customer.id)
 end

 # def favorited_by?(customer)
 #   # いいねを押したcustomer.idを全て取得、条件に当てはまるかどうか
 #   self.favorites.exists?(customer_id: customer.id)
 # end

 # 検索機能　ここから
 def self.search(search, word)
  if search == "forward_match"
   @goal = Goal.where("title LIKE?","#{word}%")
  elsif search == "backward_match"
    @goal = Goal.where("title LIKE?","%#{word}")
  elsif search == "perfect_match"
    @goal = Goal.where("#{word}")
  elsif search == "partial_match"
    @goal = Goal.where("title LIKE?","%#{word}%")
  else
    @goal = Goal.all
  end
 end
 # 検索機能　ここまで


 validates :goal_title, presence: true

 validates :goal_description, presence: true
 validates :goal_description, length: { maximum: 200 }

end
