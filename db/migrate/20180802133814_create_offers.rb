class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :bidder_email
      t.text :body
      t.references :auction, foreign_key: true

      t.timestamps
    end
  end
end
