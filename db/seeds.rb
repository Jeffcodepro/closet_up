# db/seeds.rb

puts "🧹 Limpando banco..."

# OrderItem.delete_all if defined?(OrderItem)
Order.delete_all
Offer.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all

puts "👤 Criando usuário de teste..."

users = User.create!([
  { email: "teste@teste.com",
  password: "123456" },
  { email: "user@test.com",
  password: "78910abc" },
  { email: "teste@exemplo.com",
  password: "senha-segura" }

])

puts "🗂️ Criando categorias..."

categories = Category.create!([
  { title: "Camisetas", description: "Blusas e camisetas" },
  { title: "Calças", description: "Jeans, sarja, etc" },
  { title: "Blusas", description: "Jeans, moletom, etc" },
  { title: "Acessórios", description: "Relógios, bonés, etc" }
])

puts "🛍️ Criando produtos..."

puts "Criando produtos..."

# Produto de Exemplo para a categoria "Camisetas"
camisa = Product.create!(
  title: "Camiseta com Estampa",
  description: "Camiseta de algodão, unissex, com estampa moderna e durável. Perfeita para uso diário e casual.",
  sku: "CAMS-001",
  price_cents: 99_99,
  size: ['P', 'M', 'G', 'GG'],
  user: users.sample,
  category: categories.find { |c| c.title == "Camisetas" }
)
camisa.images.attach(
  io: File.open(Rails.root.join('app/assets/images/camiseta_create.png')),
  filename: 'camiseta_create.png',
  content_type: 'image/png'
)

# Produto de Exemplo para a categoria "Calças"
calca = Product.create!(
  title: "Calça Jeans Skinny Azul",
  description: "Calça jeans com corte justo e confortável, ideal para qualquer ocasião. Possui detalhes de lavagem na frente.",
  sku: "CALC-001",
  price_cents: 149_99,
  size: ['38', '40', '42', '44'],
  user: users.sample,
  category: categories.find { |c| c.title == "Calças" }
)
calca.images.attach(
  io: File.open(Rails.root.join('app/assets/images/calca_jeans_skinny.png')),
  filename: 'calca_jeans_skinny.png',
  content_type: 'image/png'
)

# Produto de Exemplo para a categoria "Blusas"
blusa = Product.create!(
  title: "Blusa Floral de Viscose",
  description: "Blusa leve e fluida com estampa floral. Perfeita para primavera e verão.",
  sku: "BLUS-001",
  price_cents: 89_99,
  size: ['P', 'M', 'G'],
  user: users.sample,
  category: categories.find { |c| c.title == "Blusas" }
)
blusa.images.attach(
  io: File.open(Rails.root.join('app/assets/images/blusa_floral.png')),
  filename: 'blusa_floral.png',
  content_type: 'image/png'
)

# Produto de Exemplo para a categoria "Acessórios"
acessorio = Product.create!(
  title: "Relógio com Pulseira de Couro",
  description: "Relógio clássico com caixa de metal e pulseira de couro marrom. Ideal para complementar looks casuais.",
  sku: "ACSS-001",
  price_cents: 299_99,
  size: ['Único'],
  user: users.sample,
  category: categories.find { |c| c.title == "Acessórios" }
)
acessorio.images.attach(
  io: File.open(Rails.root.join('app/assets/images/relogio_acessorio.png')),
  filename: 'relogio_acessorio.png',
  content_type: 'image/png'
)

# Produto de Exemplo para a categoria "Suéteres"
sueter = Product.create!(
  title: "Blusa classica",
  description: "Blusa classica com gola redonda. Confortável e quente, perfeito para o inverno.",
  sku: "SUET-001",
  price_cents: 189_99,
  size: ['M', 'G', 'GG'],
  user: users.sample,
  category: categories.find { |c| c.title == "Blusas" }
)
sueter.images.attach(
  io: File.open(Rails.root.join('app/assets/images/blusa_classica.png')),
  filename: 'blusa_la.png',
  content_type: 'image/png'
)

puts "Criação de produtos finalizada!"

puts "Anexando banners para as categorias..."

  case Category.find_by(title: 'Camisetas')&.id
  when Category.find_by(title: 'Camisetas')&.id
    Category.find_by(title: 'Camisetas').banner.attach(
      io: File.open(Rails.root.join('app/assets/images/camisetas_banner.png')),
      filename: 'camisetas_banner.png',
      content_type: 'image/png'
    )
    puts "Banner 'camisetas_banner.jpg' anexado para a categoria 'Camisetas'."
  end

  case Category.find_by(title: 'Calças')&.id
  when Category.find_by(title: 'Calças')&.id
    Category.find_by(title: 'Calças').banner.attach(
      io: File.open(Rails.root.join('app/assets/images/calcas_banner.png')),
      filename: 'calcas_banner.png',
      content_type: 'image/png'
    )
    puts "Banner 'calcas_banner.png' anexado para a categoria 'Calças'."
  end

  case Category.find_by(title: 'Blusas')&.id
  when Category.find_by(title: 'Blusas')&.id
    Category.find_by(title: 'Blusas').banner.attach(
      io: File.open(Rails.root.join('app/assets/images/blusas_banner.png')),
      filename: 'blusas_banner.png',
      content_type: 'image/png'
    )
    puts "Banner 'Blusas_banner.jpg' anexado para a categoria 'Blusas'."
  end

  case Category.find_by(title: 'Acessórios')&.id
  when Category.find_by(title: 'Acessórios')&.id
    Category.find_by(title: 'Acessórios').banner.attach(
      io: File.open(Rails.root.join('app/assets/images/acessorios_banner.png')),
      filename: 'acessorios_banner.png',
      content_type: 'image/png'
    )
    puts "Banner 'acessorios_banner.jpg' anexado para a categoria 'Acessórios'."
  end


  puts "Processo de anexação de banners concluído."


puts "✅ Seed finalizado com sucesso!"
