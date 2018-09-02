class AddChosenToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :chosen, :boolean
  end
end
