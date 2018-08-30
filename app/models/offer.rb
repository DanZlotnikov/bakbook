class Offer < ApplicationRecord
  belongs_to :auction
  has_one_attached :offer_document

end
