class AddDocumentToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :document, :string
  end
end
