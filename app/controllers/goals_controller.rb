class GoalsController < ApplicationController
  before_action :correct_goal,only: [:edit,:update]

  def index
    # ページネーション無い時用
    # @goals = Goal.all
    @goals = Goal.page(params[:page]).reverse_order
    @customer = current_customer
    @goal = Goal.new
  end

  def show
    @goal = Goal.find(params[:id])
    @customer = @goal.customer
    @goal_new = Goal.new
    @goal_comment = GoalComment.new
    @goal_comments = @goal.goal_comments.page(params[:page]).per(10).reverse_order

    # @goal_comments = GoalComment.find(params[:id])
    # @comments_customer = @goal_comments.customer
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
      # ３. 目標詳細画面へリダイレクト
      redirect_to goal_path(@goal.id)
    else
      @goals = Goal.all
      @customer = current_customer
      redirect_to goals_path
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