class AddUserRefToOffers < ActiveRecord::Migration[5.2]
  def change
    add_reference :offers, :user_email, foreign_key: true
  end
end
