class CustomersController < ApplicationController
  before_action :correct_customer,only: [:edit,:update]

  def index
    # @customers = Customer.all
    @customers = Customer.page(params[:page]).reverse_order
    @customer = current_customer
    @goal = Goal.new
  end

  def show
    @customer = Customer.find(params[:id])
    @goal = Goal.new
    @goals = @customer.goals
  end

  # def new
  #   @goal = Goal.new
  # end

  # def create
  #   @customer = Customer.new(customer_params)
  #   if @customer.save
  #     flash[:notice] = "Welcome! You have signed up successfully."
  #     # ユーザ詳細ページに飛ばす　pathは調べる
  #     redirect_to customer_path(@customer.id)
  #   else
  #     @customers = Customer.all
  #     # サインアップの入力ページ
  #     render 'index'
  #   end
  # end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    @customer.tags.each do |tag|
      tag.delete
    end
    if @customer.update(customer_params)
      # APIここから
      tags = Vision.get_image_data(@customer.profile_image)
      tags.each do |tag|
        @customer.tags.create(tag_name: tag)
      end
      # APIここまで
      flash[:notice] = "You have updated user successfully."
      redirect_to customer_path(@customer.id)
    else
      @customers = Customer.all
      render :edit
    end
  end

  # def destroy
  #   customer = Customer.find(params[:id])
  #   customer.destroy
  #   flash[:notice] = "Goal was successfully destroyed."
  #   redirect_to customers_path
  # end

  def correct_customer
      @customer = Customer.find(params[:id])
    unless @customer.id == current_customer.id
      redirect_to customer_path(current_customer)
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :profile_image,:introduction)
  end
end