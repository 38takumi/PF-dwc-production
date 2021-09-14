class EventsController < ApplicationController
  def index
    @event = Event.new
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def show
  end

  def edit
  end

  def update
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