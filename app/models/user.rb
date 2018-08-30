class User < ApplicationRecord
  has_many :auctions, dependent: :destroy
  has_many :offers, dependent: :destroy

  validates_uniqueness_of :email
end
