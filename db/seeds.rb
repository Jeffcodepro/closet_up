# db/seeds.rb

puts "🧹 Limpando banco..."

# OrderItem.delete_all if defined?(OrderItem)
OrderItem.delete_all
Order.delete_all
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

camisa_1 = Product.create!(
  title: "Camiseta Básica Branca",
  description: "Camiseta de algodão 100%, macia e confortável, ideal para o dia a dia. Disponível em várias cores.",
  sku: "CMT-002",
  price_cents: 79_90,
  size: ['P', 'M', 'G', 'GG'],
  user: users.sample,
  category: categories.find { |c| c.title == "Camisetas" }
)
camisa_1.images.attach([
  {
    io: File.open(Rails.root.join('app/assets/images/camiseta_1.png')),
    filename: 'camiseta_1.png',
    content_type: 'image/png'
  },
  {
    io: File.open(Rails.root.join('app/assets/images/camiseta_1_person.png')),
    filename: 'camiseta_1_person.png',
    content_type: 'image/png'
  }

])

camisa_3 = Product.create!(
  title: "Camiseta Básica Preta",
  description: "Camiseta de algodão 100%, macia e confortável, ideal para o dia a dia. Disponível em várias cores.",
  sku: "CMT-003",
  price_cents: 79_90,
  size: ['P', 'M', 'G', 'GG'],
  user: users.sample,
  category: categories.find { |c| c.title == "Camisetas" }
)
camisa_3.images.attach([
  {
    io: File.open(Rails.root.join('app/assets/images/camiseta_2.png')),
    filename: 'camiseta_2.png',
    content_type: 'image/png'
  },
  {
    io: File.open(Rails.root.join('app/assets/images/camiseta_2_person.png')),
    filename: 'camiseta_2_person.png',
    content_type: 'image/png'
  },
])

camisa_4 = Product.create!(
  title: "Camiseta Básica Azul",
  description: "Camiseta de algodão 100%, macia e confortável, ideal para o dia a dia. Disponível em várias cores.",
  sku: "CMT-004",
  price_cents: 79_90,
  size: ['P', 'M', 'G', 'GG'],
  user: users.sample,
  category: categories.find { |c| c.title == "Camisetas" }
)
camisa_4.images.attach([
  {
    io: File.open(Rails.root.join('app/assets/images/camiseta_3.png')),
    filename: 'camiseta_3.png',
    content_type: 'image/png'
  },
    {
    io: File.open(Rails.root.join('app/assets/images/camiseta_3_person.png')),
    filename: 'camiseta_3_person.png',
    content_type: 'image/png'
  },

])

camisa_5 = Product.create!(
  title: "Camiseta Básica Vermelha",
  description: "Camiseta de algodão 100%, macia e confortável, ideal para o dia a dia. Disponível em várias cores.",
  sku: "CMT-005",
  price_cents: 79_90,
  size: ['P', 'M', 'G', 'GG'],
  user: users.sample,
  category: categories.find { |c| c.title == "Camisetas" }
)
camisa_5.images.attach([
  {
    io: File.open(Rails.root.join('app/assets/images/camiseta_4.png')),
    filename: 'camiseta_4.png',
    content_type: 'image/png'
  },
  {
    io: File.open(Rails.root.join('app/assets/images/camiseta_4_person.png')),
    filename: 'camiseta_4_person.png',
    content_type: 'image/png'
  },

])


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

calca_1 = Product.create!(
  title: "Calça Jeans",
  description: "Calça jeans clássica e confortável para usar todos os dias",
  sku: "CALC-002",
  price_cents: 149_99,
  size: ['38', '40', '42', '44'],
  user: users.sample,
  category: categories.find { |c| c.title == "Calças" }
)
calca_1.images.attach(
  io: File.open(Rails.root.join('app/assets/images/calca_1.png')),
  filename: 'calca_1.png',
  content_type: 'image/png'
)

calca_2 = Product.create!(
  title: "Calça Jeans Skinny",
  description: "Calça jeans skinny em denim stretch, com corte ajustado e lavagem clássica. Ideal para um visual casual e moderno.",
  sku: "CALC-003",
  price_cents: 149_99,
  size: ['38', '40', '42', '44', '46'],
  user: users.sample,
  category: categories.find { |c| c.title == "Calças" }
)
calca_2.images.attach(
  io: File.open(Rails.root.join('app/assets/images/calca_2.png')),
  filename: 'calca_2.png',
  content_type: 'image/png'
)

calca_3 = Product.create!(
  title: "Calça Jeans Azul",
  description: "Calça de jeans slim fit, cor caqui, com elastano para maior conforto. Uma peça versátil para o seu guarda-roupa.",
  sku: "CALC-004",
  price_cents: 149_99,
  size: ['38', '40', '42', '44', '46'],
  user: users.sample,
  category: categories.find { |c| c.title == "Calças" }
)
calca_3.images.attach(
  io: File.open(Rails.root.join('app/assets/images/calca_3.png')),
  filename: 'calca_3.png',
  content_type: 'image/png'
)

calca_4 = Product.create!(
  title: "Calça de Alfaiataria Clássica",
  description: "Confeccionada com um tecido de lã fria de alta qualidade, esta calça social oferece um caimento impecável e elegante. Seu corte reto tradicional garante conforto e uma silhueta atemporal, ideal para o ambiente de trabalho ou eventos formais. Apresenta bolsos faca laterais, passantes para cinto e fecho discreto. Uma peça essencial para o guarda-roupa de quem busca sofisticação e durabilidade.",
  sku: "CALC-005",
  price_cents: 149_99,
  size: ['38', '40', '42', '44', '46'],
  user: users.sample,
  category: categories.find { |c| c.title == "Calças" }
)
calca_4.images.attach(
  io: File.open(Rails.root.join('app/assets/images/calca_4.png')),
  filename: 'calca_4.png',
  content_type: 'image/png'
)

calca_5 = Product.create!(
  title: "Calça Social Slim Fit - Toque Moderno",
  description: " A calça slim fit em tecido misto de algodão e elastano oferece o equilíbrio perfeito entre elegância e conforto. Com um corte mais ajustado ao corpo, ela valoriza a silhueta sem restringir os movimentos. Perfeita para quem prefere um visual contemporâneo. Possui bolsos embutidos na parte de trás e um acabamento que evita amassados, ideal para o dia a dia agitado.",
  sku: "CALC-006",
  price_cents: 149_99,
  size: ['36','38', '40', '42', '44', '46'],
  user: users.sample,
  category: categories.find { |c| c.title == "Calças" }
)
calca_5.images.attach(
  io: File.open(Rails.root.join('app/assets/images/calca_5.png')),
  filename: 'calca_5.png',
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

blusa_1 = Product.create!(
  title: "Blusa com Gola Mandarim e Decote V",
  description: "Elegância e fluidez se encontram nesta blusa de gola mandarim, confeccionada em um tecido leve e sofisticado. O decote em V sutil e os detalhes plissados no ombro e nos punhos adicionam um toque de charme e movimento. Perfeita para um look de trabalho refinado ou para um evento especial.",
  sku: "BLUS-002",
  price_cents: 89_99,
  size: ['P', 'M', 'G'],
  user: users.sample,
  category: categories.find { |c| c.title == "Blusas" }
)
blusa_1.images.attach(
  io: File.open(Rails.root.join('app/assets/images/blusa_1.png')),
  filename: 'blusa_1.png',
  content_type: 'image/png'
)

blusa_2 = Product.create!(
  title: "Blusa de Linho com Bordado",
  description: "Combine o conforto casual do linho com um toque artesanal nesta blusa de manga longa. O tecido natural e respirável é ideal para dias mais quentes, enquanto o delicado bordado em branco no decote e nos punhos confere um detalhe único e elegante. Uma peça versátil que transita do dia para a noite com facilidade.",
  sku: "BLUS-003",
  price_cents: 99_99,
  size: ['P', 'M', 'G'],
  user: users.sample,
  category: categories.find { |c| c.title == "Blusas" }
)
blusa_2.images.attach(
  io: File.open(Rails.root.join('app/assets/images/blusa_2.png')),
  filename: 'blusa_2.png',
  content_type: 'image/png'
)

blusa_3 = Product.create!(
  title: "Blusa de Seda com Manga Bufante",
  description: "Sofisticada e moderna, esta blusa de seda em tom verde sálvia oferece um caimento impecável e um brilho sutil. As mangas longas e ligeiramente bufantes adicionam volume e drama à peça, enquanto o decote em V suave a torna feminina e elegante. Ideal para criar um visual impactante e cheio de estilo.",
  sku: "BLUS-004",
  price_cents: 109_99,
  size: ['P', 'M', 'G'],
  user: users.sample,
  category: categories.find { |c| c.title == "Blusas" }
)
blusa_3.images.attach(
  io: File.open(Rails.root.join('app/assets/images/blusa_3.png')),
  filename: 'blusa_3.png',
  content_type: 'image/png'
)

blusa_4 = Product.create!(
  title: "Camisa Masculina Gola Padre com Detalhe de Âncora",
  description: "Clássica com um toque náutico, esta camisa masculina de manga curta apresenta uma elegante gola padre e um charmoso detalhe de âncora bordado no bolso frontal. Confeccionada em um tecido leve e respirável de algodão, é perfeita para os dias mais quentes, oferecendo conforto e estilo casual refinado. Ideal para um passeio à beira-mar ou um encontro descontraído com amigos.",
  sku: "BLUS-005",
  price_cents: 79_99,
  size: ['P', 'M', 'G'],
  user: users.sample,
  category: categories.find { |c| c.title == "Blusas" }
)
blusa_4.images.attach(
  io: File.open(Rails.root.join('app/assets/images/blusa_4.png')),
  filename: 'blusa_4.png',
  content_type: 'image/png'
)

blusa_5 = Product.create!(
  title: "Suéter Masculino de Tricô com Textura de Tranças",
  description: "Abrace o conforto e o estilo com este elegante suéter masculino de tricô. A rica textura de tranças no corpo do suéter adiciona um toque clássico e sofisticado, enquanto o tom verde escuro confere versatilidade para diversas combinações. Confeccionado em um fio macio e quente, é perfeito para os dias mais frios, proporcionando aconchego sem abrir mão da elegância. Uma peça essencial para um guarda-roupa masculino bem equipado.",
  sku: "BLUS-006",
  price_cents: 239_99,
  size: ['P', 'M', 'G'],
  user: users.sample,
  category: categories.find { |c| c.title == "Blusas" }
)
blusa_5.images.attach(
  io: File.open(Rails.root.join('app/assets/images/blusa_5.png')),
  filename: 'blusa_5.png',
  content_type: 'image/png'
)

blusa_6 = Product.create!(
  title: "Suéter Feminino de Tricô Grosso",
  description: "Abrace o conforto e o estilo com este suéter feminino de tricô grosso. Com um caimento oversized e um tom terracota terroso e acolhedor, esta peça é a definição de elegância casual. As mangas bufantes e o design relaxado o tornam perfeito para um visual descontraído, ideal para os dias mais frios.",
  sku: "BLUS-007",
  price_cents: 249_99,
  size: ['P', 'M', 'G'],
  user: users.sample,
  category: categories.find { |c| c.title == "Blusas" }
)
blusa_6.images.attach(
  io: File.open(Rails.root.join('app/assets/images/blusa_6.png')),
  filename: 'blusa_6.png',
  content_type: 'image/png'
)

blusa_7 = Product.create!(
  title: "Suéter de Lã e Alpaca com Gola Alta - Creme",
  description: "Este suéter de alta qualidade é uma combinação de luxo e aconchego. Confeccionado em um blend de lã e alpaca, ele apresenta uma rica textura de tranças e uma cor creme neutra, fácil de combinar. A gola alta e o caimento perfeito adicionam um toque de sofisticação, tornando-o uma peça essencial para o inverno.",
  sku: "BLUS-008",
  price_cents: 849_99,
  size: ['P', 'M', 'G'],
  user: users.sample,
  category: categories.find { |c| c.title == "Blusas" }
)
blusa_7.images.attach(
  io: File.open(Rails.root.join('app/assets/images/blusa_7.png')),
  filename: 'blusa_7.png',
  content_type: 'image/png'
)

blusa_8 = Product.create!(
  title: "Suéter de Tricô Canelado Confortável - Caramelo",
  description: "Abrace o aconchego com este suéter de tricô canelado em um tom caramelo quente e versátil. Com um caimento relaxado e mangas volumosas, oferece conforto e estilo para os dias mais frescos. Uma peça essencial para o seu guarda-roupa de inverno, fácil de combinar com diversas peças para criar looks casuais e elegantes.",
  sku: "BLUS-009",
  price_cents: 239_99,
  size: ['P', 'M', 'G'],
  user: users.sample,
  category: categories.find { |c| c.title == "Blusas" }
)
blusa_8.images.attach(
  io: File.open(Rails.root.join('app/assets/images/blusa_8.png')),
  filename: 'blusa_8.png',
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

acessorio_1 = Product.create!(
  title: "Bolsa de Couro Elegante com Detalhe de Serpente",
  description: "Sofisticação e ousadia se unem nesta bolsa de couro italiana, em um tom preto clássico e atemporal. A silhueta estruturada e o fecho exclusivo em formato de serpente dourada com olhos de esmeralda conferem um toque de luxo e personalidade. Ideal para quem busca uma peça statement que eleva qualquer look, do casual ao formal. Possui alça superior e alça de corrente removível para maior versatilidade.",
  sku: "ACSS-002",
  price_cents: 999_99,
  size: ['Único'],
  user: users.sample,
  category: categories.find { |c| c.title == "Acessórios" }
)
acessorio_1.images.attach(
  io: File.open(Rails.root.join('app/assets/images/acessorio_1.png')),
  filename: 'acessorio_1.png',
  content_type: 'image/png'
)

acessorio_2 = Product.create!(
  title: "Carteira Masculina de Couro Vintage Marrom",
  description: "Confeccionada em couro legítimo com acabamento vintage, esta carteira combina durabilidade e estilo rústico. Seu design funcional oferece múltiplos compartimentos para cartões, cédulas e documentos, mantendo tudo organizado e acessível. Compacta e elegante, é a companheira perfeita para o dia a dia do homem moderno que valoriza a qualidade e o charme do couro autêntico.",
  sku: "ACSS-003",
  price_cents: 99_99,
  size: ['Único'],
  user: users.sample,
  category: categories.find { |c| c.title == "Acessórios" }
)
acessorio_2.images.attach(
  io: File.open(Rails.root.join('app/assets/images/acessorio_2.png')),
  filename: 'acessorio_2.png',
  content_type: 'image/png'
)

acessorio_3 = Product.create!(
  title: "Colar Elegante de Safira e Diamantes",
  description: "Colar sofisticado com pingente de safira azul e diamantes em ouro branco. Perfeito para ocasiões especiais.",
  sku: "ACSS-004",
  price_cents: 1599_99,
  size: ['Único'],
  user: users.sample,
  category: categories.find { |c| c.title == "Acessórios" }
)
acessorio_3.images.attach(
  io: File.open(Rails.root.join('app/assets/images/acessorio_3.png')),
  filename: 'acessorio_3.png',
  content_type: 'image/png'
)

acessorio_4 = Product.create!(
  title: "Brincos de Safira Oval e Diamantes em Prata",
  description: "Elegância clássica em cada detalhe. Estes deslumbrantes brincos apresentam uma vibrante safira oval, envolta por um halo de pequenos diamantes brilhantes. A montagem em prata realça a beleza das pedras, proporcionando um toque de sofisticação atemporal. Perfeitos para ocasiões especiais ou para adicionar um toque de cor e brilho ao seu dia a dia.",
  sku: "ACSS-005",
  price_cents: 599_99,
  size: ['Único'],
  user: users.sample,
  category: categories.find { |c| c.title == "Acessórios" }
)
acessorio_4.images.attach(
  io: File.open(Rails.root.join('app/assets/images/acessorio_4.png')),
  filename: 'acessorio_4.png',
  content_type: 'image/png'
)

acessorio_5 = Product.create!(
  title: "Pulseira de Prata com Zircônias",
  description: "Adicione um toque de brilho sutil ao seu pulso com esta pulseira de prata, delicadamente adornada com pequenas zircônias cintilantes. O design clássico e atemporal torna esta peça perfeita para ser usada sozinha ou combinada com outras pulseiras. Uma joia elegante e versátil, ideal para qualquer ocasião e para presentear.",
  sku: "ACSS-006",
  price_cents: 599_99,
  size: ['Único'],
  user: users.sample,
  category: categories.find { |c| c.title == "Acessórios" }
)
acessorio_5.images.attach(
  io: File.open(Rails.root.join('app/assets/images/acessorio_5.png')),
  filename: 'acessorio_5.png',
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
