class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :offers
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :sku, presence: true, uniqueness: true
end
