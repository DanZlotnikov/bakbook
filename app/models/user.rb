class User < ApplicationRecord
  has_many :auctions, dependent: :destroy
  has_many :offers, dependent: :destroy
end
