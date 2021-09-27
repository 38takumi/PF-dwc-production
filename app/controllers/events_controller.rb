class EventsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @event = Event.new
    @events = Event.where(customer_id: current_customer.id)
    # @event_show = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  # 現在は使っていない部分　ここから
  # def btn_new
  #   @event = Event.new
  # end

  # def btn_create
  #   @event = Event.new(event_params)
  #   @event.save
  #   @events = Event.all
  #   redirect_to action: :show
  # end
  # 現在は使っていない部分　ここまで

  def show
    @event = Event.find(params[:id])
    @customer = @event.customer
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def event_params
    params.require(:event).permit(:event_title, :event_description, :event_start, :event_end).merge(customer_id: current_customer.id)
  end
end