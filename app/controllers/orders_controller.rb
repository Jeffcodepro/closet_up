class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  def index
    @orders = current_user.orders.all
  end


  def create
    product = Product.find(params[:order][:product_id])

    order_data = order_params.merge(
    user: current_user,
    product: product,
    product_sku: product.sku,
    amount: product.price,
    state: 'pending'
  )
    order  = Order.create!(order_data)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        quantity: 1,
        price_data: {
          unit_amount: product.price_cents.to_i,
          currency: 'brl',
          product_data: {
            name: product.sku
          }
        }
      }],
      mode: 'payment',
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
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
