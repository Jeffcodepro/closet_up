class AddSizeToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :size, :string
  end
end
