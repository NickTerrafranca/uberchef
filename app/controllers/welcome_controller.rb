class WelcomeController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to landing_page_path
    end
  end

  def landing_page
  end
end
