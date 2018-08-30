class ChangePrivateToIsPrivate < ActiveRecord::Migration[5.2]
  def change
    rename_column :auctions, :private, :is_private
  end
end
