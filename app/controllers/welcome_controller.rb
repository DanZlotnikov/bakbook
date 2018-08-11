class WelcomeController < ApplicationController
  def index
    if session[:is_logged]
      redirect_to new_auction_path
    end
    @logged_user_name = session[:logged_user_name]
    @is_logged = session[:is_logged]
  end
end
