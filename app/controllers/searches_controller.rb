class SearchesController < ApplicationController
  def search
    @range = params[:range]
    search = params[:search]
    @word = params[:word]

    if @range == '1'
     @customers = Customer.search(search,@word)
     @customers = @customers.page(params[:page])
    elsif @range == '2'
     @goals = Goal.search(search,@word)
     @goals = @goals.page(params[:page])
    elsif @range == '3'
     @events = current_customer.events.search(search,@word)
     # @events = Event.search(search,@word)
     @events = @events.page(params[:page])
    else
     @tags = Tag.search(search,@word)
     @tags = @tags.page(params[:page])
    end
  end
end