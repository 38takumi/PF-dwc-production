class GoalCommentsController < ApplicationController
  # before_action :correct_goal_comment,only: [:destroy]
  before_action :authenticate_customer!

  
  def create
    @goal = Book.find(params[:goal_id])
    # 空のコメントを作る
    @goal_comment = current_customer.goal_comments.new(goal_comment_params)
    @goal_comment.goal_id = @goal.id
    # ユーザーのidを指定する
    @goal_comment.customer_id = current_customer.id    
  
    # 同じならsave
    if @goal_comment.save
      redirect_to goal_path(@goal.id)
    else
      render 'goals/show'
    end
    
  end
  
  def destroy
    # goal_commentを特定する
    @goal = Goal.find(params[:goal_id])
  	goal_comment = @goal.goal_comments.find(params[:id])
    goal_comment.destroy
    redirect_to goal_path(@goal.id)
    # redirect_to request.referer
  end
  
  # def correct_goal_comment
  #   @goal_comment = Goal_comments.find(params[:id])
  #   unless @goal_comment.customer.id == current_customer.id
  #     # redirect_to goals_path
  #     redirect_to goal_path(goal_comment.goal)
  #   end
  # end
    
  private
  def goal_comment_params
    params.require(:goal_comment).permit(:customer_comment)
  end
end
