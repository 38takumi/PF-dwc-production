class SearchesController < ApplicationController
  def search
    @range = params[:range]
    search = params[:search]
    @word = params[:word]

    if @range == '1'
     @customer = Customer.search(search,@word)
    elsif @range == '2'
     @goal = Goal.search(search,@word)
    else
     @event = Event.search(search,@word)
    end
  end
end
