class CategoriesController < ApplicationController

  def show
      # Encontra a categoria pelo ID na URL (ex: /categories/1)
      @category = Category.find_by(id: params[:id])

      if @category
        # Filtra os produtos para mostrar apenas os desta categoria
        @products = @category.products
      else
        # Redireciona ou mostra uma página de erro se a categoria não existir
        redirect_to root_path, alert: "Categoria não encontrada."
      end
  end
end
