class Auction < ApplicationRecord
  INDUSTRY_OPTIONS = ['Choose Industry', 'Metal', 'Wood', 'Electric', 'Textile', 'Plastic', 'Paper', 'Fabric', 'Transport', 'Chemical', 'Biological', 'Infrastructure']

  has_many :offers, dependent: :destroy
  validates :title, presence: true
  has_one_attached :auction_document

  before_save :get_lacking_info

  private

  def get_lacking_info
    unless self.user_id.nil?
      self.buyer = User.find(user_id).email
      self.industry = User.find(user_id).industry

    else
      if self.industry == 'Choose Industry'
        self.industry = nil
      end
    end
  end

end
