class RemovePriceColumnFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :price, :decimal
  end
end
