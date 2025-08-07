# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Exemplo:
# db/seeds.rb

puts "🧹 Limpando banco..."

Offer.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all

puts "👤 Criando usuário de teste..."

user = User.create!(
  email: "teste@teste.com",
  password: "123456"
)

puts "🗂️ Criando categorias..."

categories = Category.create!([
  { title: "Camisetas", description: "Blusas e camisetas" },
  { title: "Calças", description: "Jeans, sarja, etc" },
  { title: "Blusas", description: "Jeans, moletom, etc" },
  { title: "Acessórios", description: "Relógios, bonés, etc" }
])

puts "🛍️ Criando produtos..."

10.times do |i|
  Product.create!(
    title: "Produto #{i + 1}",
    description: "Descrição do produto #{i + 1}",
    sku: "SKU#{i + 1}",
    price: rand(50..300),
    user: user,
    category: categories.sample
  )
end

puts "✅ Seed finalizado com sucesso!"
