class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  SIZES = %w[PP P M G GG XG].freeze

  monetize :price_cents

  has_many :offers, dependent: :destroy
  # has_one_attached :image
  has_many_attached :images

  validates :size, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :sku, presence: true, uniqueness: true

end
