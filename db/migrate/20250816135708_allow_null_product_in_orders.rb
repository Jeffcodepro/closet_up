class AllowNullProductInOrders < ActiveRecord::Migration[7.1]
  def change
    change_column_null :orders, :product_id, true
  end
end
