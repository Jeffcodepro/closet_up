class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  def index
    @orders = current_user.orders
                          .order(created_at: :desc)
                          .includes(order_items: :product)
  end

  def show
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Order not found."
  end

  def order_params
    params.require(:order).permit(:product_id, :size, :amount)
  end
end
