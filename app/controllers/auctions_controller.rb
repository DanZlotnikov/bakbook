class AuctionsController < ApplicationController
  helper_method :sort_column, :sort_direction, :sort_industry

  def index
    if params_for_private_auctions
      show_private_auctions
      @my_auctions = true
      return
    end

    begin
      @auctions = User.find(params_for_my_auctions).auctions
      @my_auctions = true
    rescue
      @auctions = Auction.where({is_private: false})
    end

    unless sort_industry == 0
      @auctions = @auctions.where(:industry => sort_industry).order(sort_column + " " + sort_direction)
    else
      @auctions = @auctions.order(sort_column + " " + sort_direction)
    end
  end

  def show
    @auction = Auction.find(params[:id])
    if @auction.user_id.nil?
      @user_email = @auction.buyer
    else
      @user = User.find(@auction.user_id)
      @user_email = @user.email
    end
  end

  def new
    @auction = Auction.new
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def create
    is_private = auction_params[:supplier].empty? || auction_params[:supplier].nil?  ? false : true
    @auction = Auction.new(auction_params.merge(:user_id => session[:logged_user_id]).merge(:is_private => is_private))
    @auction.auction_document.attach(auction_params[:auction_document])

    if @auction.save
      redirect_to @auction
    else
      render 'new'
    end
  end

  def update
    @auction = Auction.find(params[:id])

    if @auction.update(auction_params)
      redirect_to @auction
    else
      render 'edit'
    end
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy

    redirect_to auctions_path
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :description, :buyer, :industry, :auction_document, :supplier)
  end

  def params_for_my_auctions
    params[:user_id].to_s == session[:logged_user_id].to_s ? params[:user_id] : 0
  end

  def params_for_private_auctions
    %w[true false].include?(params[:is_private]) ? true : false
  end

  def sort_column
    # This is a big fancy if to only allow column names
    Auction.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    # This is a big fancy if to only allow asc/desc
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def sort_industry
    Auction::INDUSTRY_OPTIONS.include?(params[:industry]) ? params[:industry] : 0
  end


  def show_private_auctions
    @auctions = Auction.where(:supplier => session[:logged_user_email], :is_private => true)
  end
end
