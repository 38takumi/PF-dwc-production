class SearchesController < ApplicationController
  def search
    @range = params[:range]
    search = params[:search]
    @word = params[:word]

    if @range == '1'
     @customers = Customer.search(search,@word)
    elsif @range == '2'
     @goals = Goal.search(search,@word)
    else
     @events = Event.search(search,@word)
    end
  end
end
