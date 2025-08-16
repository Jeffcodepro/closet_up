class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }

  before_validation :set_unit_price_from_product, on: :create

  def line_total_cents
    quantity * unit_price_cents
  end

  private

  def set_unit_price_from_product
    self.unit_price_cents ||= product&.price_cents || 0
  end
end
