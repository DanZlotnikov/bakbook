class Auction < ApplicationRecord
  has_many :offers, dependent: :destroy
  validates :title, presence: true

  before_save :get_buyer

  private

  def get_buyer
    unless self.user_id.nil?
      self.buyer = User.find(user_id).email
    end
  end

end
