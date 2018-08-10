class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.string :buyer
      t.string :provider
      t.string :industry

      t.timestamps
    end
  end
end
