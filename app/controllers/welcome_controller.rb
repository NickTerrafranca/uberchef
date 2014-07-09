class WelcomeController < ApplicationController
  def index
    unless current_user
      redirect_to landing_page_path
    end
  end

  def landing_page
  end
end
