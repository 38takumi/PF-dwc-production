class GoalsController < ApplicationController
  before_action :correct_goal,only: [:edit,:update]

  def index
    # @goals = Goal.all
    @goals = Goal.page(params[:page]).reverse_order
    @customer = current_customer
    # follow,follower数用　いらないかも
    # @customers = @customer.followings
    @goal = Goal.new
  end

  def show
     @goal = Goal.find(params[:id])
     # @goalのユーザ
     @customer = @goal.customer
     # follow,follower数用　いらないかも
    # @customers = Customer.find(params[:id])
     @goal_new = Goal.new
     @goal_comment = GoalComment.new
  end

  # def new
  #   @goal = Goal.new
  #   redirect_to goal_path(@goal.id)
  # end

  def create
     # １. データを新規登録するためのインスタンス作成
    @goal = Goal.new(goal_params)
    @goal.customer_id = current_customer.id
     # ２. データをデータベースに保存するためのsaveメソッド実行
    if @goal.save
      flash[:notice] = "Goal was successfully created."
       # ３. ブック詳細画面へリダイレクト
      redirect_to goal_path(@goal.id)
    else
      @goals = Goal.all
      @customer = current_customer
      render :index
    end
  end

  def edit
     @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.customer_id = current_customer.id
    if @goal.update(goal_params)
      flash[:notice] = "Goal was successfully created."
      redirect_to goal_path(@goal.id)
    else
      @goals = Goal.all
      render :edit
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    flash[:notice] = "Goal was successfully destroyed."
    redirect_to goals_path
  end

   def correct_goal
        @goal = Goal.find(params[:id])
    unless @goal.customer.id == current_customer.id
      redirect_to goals_path
    end
   end


  private
  def goal_params
    params.require(:goal).permit(:goal_title, :goal_description)
  end

  def goal_comments_params
    params.require(:goal_comments).permit(:customer_comment)
  end
end
