class UsersController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @user = User.order('last_name')
  # end

  def show
    @user = User.find(params[:id])
  end
end
