class AddUserRefToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_reference :auctions, :user_email, foreign_key: true
  end
end
