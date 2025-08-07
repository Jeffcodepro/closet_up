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
