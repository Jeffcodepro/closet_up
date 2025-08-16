class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.find(params[:order_id])
    redirect_to cart_path, alert: "Seu carrinho está vazio." and return if @order.order_items.empty?

    @items = @order.order_items.includes(product: { images_attachments: :blob })
  end
end
