class CartsController < ApplicationController
  before_action :authenticate_user!, only: :checkout

  def show
    @order = current_order
  end

  def checkout
    @order = current_order
    if @order.order_items.empty?
      redirect_to cart_path, alert: "Seu carrinho está vazio."
      return
    end

    # Atualiza totais e estado antes do Stripe
    @order.update!(state: "pending", amount_cents: @order.subtotal_cents)

    # Monta os line_items a partir do carrinho
    line_items = @order.order_items.map do |item|
      {
        quantity: item.quantity,
        price_data: {
          unit_amount: item.unit_price_cents,
          currency: 'brl',
          product_data: {
            name: "#{item.product.title}#{item.size.present? ? " (#{item.size})" : ""}",
            metadata: {
              product_id: item.product_id,
              order_id: @order.id,
              size: item.size.to_s
            }
          }
        }
      }
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: line_items,
      success_url: order_url(@order),  # Exibe o pedido
      cancel_url: cart_url             # Volta ao carrinho
    )

    @order.update!(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end
end
