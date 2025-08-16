class ApplicationController < ActionController::Base
  helper_method :current_order

  private

  def current_order
    return unless current_user

    # Reaproveita o "carrinho aberto" do usuário
    @current_order ||= Order.find_by(user: current_user, state: "cart") ||
                       Order.create!(user: current_user, state: "cart", amount_cents: 0)
  end
end
