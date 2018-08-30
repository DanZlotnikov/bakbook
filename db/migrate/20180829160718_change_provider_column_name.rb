class ChangeProviderColumnName < ActiveRecord::Migration[5.2]
  def change
      rename_column :auctions, :provider, :supplier
  end
end
