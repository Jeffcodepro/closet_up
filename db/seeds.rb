# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Offer.destroy_all
Product.destroy_all
Category.destroy_all
puts "Database cleaned!"

puts "Creating users..."
user1 = User.create!(email: "user1@example.com", password: "password", password_confirmation: "password")
user2 = User.create!(email: "user2@example.com", password: "password", password_confirmation: "password")
puts "#{User.count} users created!"


puts "Creating categories..."
pants = Category.create!(title: "Calças", description: "Calças, jeans e leggings.")
female = Category.create!(title: "Feminino", description: "Roupas femininas, incluindo vestidos e saias.")
male = Category.create!(title: "Masculino", description: "Roupas masculinas, incluindo camisas e calças.")
puts "#{Category.count} categories created!"


puts "Creating products..."
product1 = Product.create!(
  title: "Calça flare",
  description: "Calça flare de alta qualidade, disponível em vários tamanhos.",
  sku: "BATCH2005-001",
  price: 100.00,
  category: female,
  user: user1
)

product2 = Product.create!(
  title: "Camiseta de algodão",
  description: "Camiseta de algodão macio e confortável, ideal para o dia a dia.",
  sku: "BATCH2005-002",
  price: 29.99,
  category: female,
  user: user1
)

product3 = Product.create!(
  title: "Calça jeans",
  description: "Calça jeans clássica, perfeita para qualquer ocasião.",
  sku: "BATCH2005-003",
  price: 49.99,
  category: pants,
  user: user2
)
puts "#{Product.count} products created!"


puts "Creating offers..."
Offer.create!(
  user: user2,
  product: product1
)

Offer.create!(
  user: user1,
  product: product3
)
puts "#{Offer.count} offers created!"

puts "Seeds finished!"
