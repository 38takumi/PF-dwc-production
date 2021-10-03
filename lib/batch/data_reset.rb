class Batch::DataReset
  # メソッド　ここから
  def self.goal_comment_1000_destory
    @customers = Customer.all
    @customers.each do  |customer|
      sum = customer.goal_comments.count
      while sum > 1000
        customer.goal_comments.first.destroy
        sum = customer.goal_comments.count
        if customer.goal_comments.first.destroy
          sum = customer.goal_comments.count
        else
          break
        end
      end
    end
    p "古い投稿を削除しました"

  #   @goal = Goal.find(params[:goal_id])
  #   goal_comment = @goal.goal_comments.find(params[:id])
  #   @customer = Customer.find(params[:id])
  #   sum = goal_comment.count
  #   while sum >= 1000
  #     goal_comment.destroy
  #     current_user.goals.find_by(goal_comment_id: params[:goal_comment_id]).destroy!
  #   end
  #   p "古い投稿を削除しました"

  end
  # メソッド　ここまで
end