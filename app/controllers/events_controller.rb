class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if params[:search]
      @event = Event.search(params[:search]).page(params[:page]).per(12)
    else
      @event = Event.current_events.order('created_at DESC').page(params[:page]).per(12)
      # @event = Event.where('created_at >= ? OR updated_at >= ?', Date.today, Date.today).page(params[:page]).per(12)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @user = current_user
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(
      :title, :address, :city, :state, :zip,
      :start_date, :start_time, :duration, :guest_count, :budget, :description,
      :pickadate_date, :pickadate_time
      )
  end
end
