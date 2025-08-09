class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  monetize :price_cents

  has_many :offers, dependent: :destroy
  has_one_attached :image
  has_many :offers
  has_many_attached :images

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :sku, presence: true, uniqueness: true
end
