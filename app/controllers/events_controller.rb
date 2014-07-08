class EventsController < ApplicationController

  def show
    @event = Event.all.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.user_id = current_user.id
    if @event.save
      flash[:notice] = 'Successfully created...'
      redirect_to event_path(@event)
    else
      flash[:notice] = 'There was a problem saving your submission...'
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :title, :address, :city, :state, :zip,
      :start_time, :end_time, :guest_count, :budget, :description
      )
  end
end
