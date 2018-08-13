class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
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
    @auction = Auction.new(auction_params.merge(:user_id => session[:logged_user_id]))
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
    params.require(:auction).permit(:title, :description, :buyer, :industry, :auction_document)
  end
end
