class BidsController < ApplicationController
  before_action :authenticate_user!

  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @bid = Bid.new
    @event = Event.find(params[:event_id])
  end

  def create
    @bid = Bid.create(bid_params)
    @event = Event.find(params[:event_id])
    @bid.user_id = current_user.id
    @bid.event = @event
    if @bid.save
      flash[:notice] = 'Successfully created...'
      redirect_to event_bid_path(@event, @bid)
    else
      flash[:notice] = 'There was a problem saving your submission...'
      render :new
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:message, :amount)
  end
end
