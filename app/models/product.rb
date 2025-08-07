class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :offers

  has_one_attached :image
end
