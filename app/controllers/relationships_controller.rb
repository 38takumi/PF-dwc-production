class RelationshipsController < ApplicationController
  #フォロー機能を使う時
  def create
    current_customer.follow(params[:customer_id])
    # current_customer.follow(relationship_params)
    redirect_to request.referer
  end

  #フォロー機能を無効にする時
  def destroy
    current_customer.unfollow(params[:customer_id])
    # current_customer.unfollow(relationship_params)
    redirect_to request.referer
  end

  #フォロー一覧を表示する時
  def followings
    customer = Customer.find(params[:customer_id])
    # customer = Customer.find(relationship_params)
    @customers = customer.followings
  end

  #・フォロワー一覧を表示する時
  def followers
    customer = Customer.find(params[:customer_id])
    # customer = Customer.find(relationship_params)
    @customers = customer.followers
  end



  # private
  # def relationship_params
  #   params.require(:relationship).permit(:follower_id, :followed_id)
  # end
end
