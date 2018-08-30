class AddPrivateToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :private, :boolean
  end
end
