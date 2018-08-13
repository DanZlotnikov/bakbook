class Auction < ApplicationRecord
  has_many :offers, dependent: :destroy
  validates :title, presence: true
  has_one_attached :auction_document

  before_save :get_buyer

  private

  def get_buyer
    unless self.user_id.nil?
      self.buyer = User.find(user_id).email
    end
  end

end
