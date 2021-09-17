class Batch::DataReset
  # メソッド　ここから
  def goal_comment_1000_destory
    @goal = Goal.find(params[:goal_id])
    goal_comment = @goal.goal_comments.find(params[:id])
    @customer = Customer.find(params[:id])
    sum = goal_comment.count
    while sum >= 1000
      goal_comment.destroy
      current_user.goals.find_by(goal_comment_id: params[:goal_comment_id]).destroy!
    end
    p "古い投稿を削除しました"
  end
  # メソッド　ここまで
end