class WelcomeController < ApplicationController
  def index
    @logged_user_name = session[:logged_user_name]
    @is_logged = session[:is_logged]
  end
end
