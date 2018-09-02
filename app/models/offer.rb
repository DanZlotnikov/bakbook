class Offer < ApplicationRecord
  belongs_to :auction
  has_one_attached :offer_document

  before_create :make_offer_not_chosen

  private

  def make_offer_not_chosen
    self.chosen = false
  end
end
