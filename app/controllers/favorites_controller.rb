class FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    # goalのidをcustomer.idと設定している
    @goal = Goal.find(params[:goal_id])
    favorite = @goal.favorites.new(customer_id: current_customer.id)
    favorite.save
    # redirect_to goal_path(@goal.id)
    redirect_to request.referer
  end

  def destroy
    @goal = Goal.find(params[:goal_id])
    favorite = @goal.favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
    # redirect_to goal_path(@goal.id)
    redirect_to request.referer
  end
end