class SessionsController < ApplicationController
  def new

  end

  def create
    begin
      user = User.find_by(email: login_params[:email])
      if login_params[:password] == user.password
        session[:logged_user_name] = user.name
        session[:logged_user_email] = user.email
        session[:is_logged] = true
        session[:logged_user_id] = user.id
        redirect_to auctions_path
      else
        raise
      end
    rescue
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_back fallback_location: auctions_path
  end

  private
  def login_params
    params.require(:session).permit(:email, :password)
  end

end
