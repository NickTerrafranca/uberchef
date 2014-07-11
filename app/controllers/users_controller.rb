class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
        # binding.pry

    # @event = Event.find(current_user)
    # binding.pry
    # if @user.bids.any?#exists?
    #   @bid = Bid.find(current_user.id)
    # end
  end

end
