class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true

  monetize :amount_cents

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  STATES = %w[cart pending paid completed canceled].freeze

  def subtotal_cents
    order_items.sum { |i| i.quantity * i.unit_price_cents }
  end

  def recalc_total!
    update!(amount_cents: subtotal_cents)
  end

  def add_product(product, size: nil, quantity: 1)
    item = order_items.find_by(product_id: product.id, size: size)
    if item
      item.quantity += quantity
      item.save!
    else
      order_items.create!(
        product: product,
        size: size,
        quantity: quantity,
        unit_price_cents: product.price_cents
      )
    end
    recalc_total!
  end
end
