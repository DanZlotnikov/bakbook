class OffersController < ApplicationController

  def create
    @auction = Auction.find(params[:auction_id])
    @offer = @auction.offers.create(offer_params.merge(:user_id => session[:logged_user_id]))
    redirect_to auction_path(@auction)
  end

  def destroy
    @auction = Auction.find(params[:auction_id])
    @offer = @auction.offers.find(params[:id])
    @offer.destroy
    redirect_to auction_path(@auction)
  end

  private
  def offer_params
    params.require(:offer).permit(:bidder_email, :body)
  end
end
