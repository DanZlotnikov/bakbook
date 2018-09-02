class OffersController < ApplicationController

  def create
    @auction = Auction.find(params[:auction_id])
    @offer = Offer.new(offer_params.merge(:user_id => session[:logged_user_id]).merge(:auction_id => @auction.id))
    @offer.offer_document.attach(offer_params[:offer_document])

    @offer.save!
    redirect_to auction_path(@auction)
  end

  def index
    if my_offers_param == 0
      redirect_to auctions_path
    else
      @offers = User.find(my_offers_param).offers
    end
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update_attribute(:chosen, true)

    @auction = Auction.find(params[:auction_id])
    @user = User.find(@offer.user_id)

    @offer.auction.update_attribute(:supplier, @user.email)
    redirect_to auction_path(@offer.auction)
  end

  def destroy
    @auction = Auction.find(params[:auction_id])
    @offer = @auction.offers.find(params[:id])
    @offer.destroy
    redirect_to auction_path(@auction)
  end

  private

  def offer_params
    params.require(:offer).permit(:bidder_email, :body, :offer_document)
  end

  def my_offers_param
    params[:user_id].to_s == session[:logged_user_id].to_s ? params[:user_id] : 0
  end
end
