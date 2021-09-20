class CustomersController < ApplicationController
  before_action :correct_customer,only: [:edit,:update]

  def index
    # @customers = Customer.all
    @customers = Customer.page(params[:page]).reverse_order
    @customer = current_customer
    # 次の１行は多分使っていないのでテストしてから消す
    # @goals = Goal.all
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
    @customer = Customer.find(params[:id])
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "You have updated user successfully."
      # ユーザー詳細ページに飛ばす
      redirect_to customer_path(@customer.id)
    else
      @customers = Customer.all
      # ユーザー編集ページに飛ばす
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