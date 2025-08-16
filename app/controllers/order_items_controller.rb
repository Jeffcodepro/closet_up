class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    product  = Product.find(params[:product_id])
    size     = params[:size].presence
    quantity = params[:quantity].present? ? params[:quantity].to_i : 1

    sizes = Array(product.size).reject(&:blank?)
    if sizes.any? && size.blank?
      redirect_back fallback_location: product_path(product), alert: "Selecione um tamanho."
      return
    end

    @order.add_product(product, size: size, quantity: quantity)
    session[:order_id] = @order.id  # <- garante que a sessão “prende” nesse pedido
    redirect_to cart_path, notice: "Produto adicionado ao carrinho."
  end

  def update
    item = @order.order_items.find(params[:id])
    qty  = params[:quantity].to_i

    if qty > 0
      item.update!(quantity: qty)
    else
      item.destroy!
    end

    @order.recalc_total!
    redirect_to cart_path, notice: "Carrinho atualizado."
  end

  def destroy
    item = @order.order_items.find(params[:id])
    item.destroy!
    @order.recalc_total!
    redirect_to cart_path, notice: "Item removido."
  end

  private

  def set_order
    @order = current_order
  end
end
