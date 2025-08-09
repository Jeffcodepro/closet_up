class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    if params[:category_id]
      @category = Category.find_by(id: params[:category_id])
      if @category
        @products = Product.where(category: @category)
      else
        redirect_to products_path, alert: "Categoria não encontrada"
      end
    else
      @products = Product.all
    end
  end

  def show
    @offers = @product.offers.includes(:user) if @product.respond_to?(:offers)
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = current_user.products.build(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product), notice: "Produto criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Produto excluído com sucesso."
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Produto atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :sku, :price, :category_id, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def authorize_user!
    unless @product.user == current_user
      redirect_to products_path, alert: "Você não está autorizado a realizar esta ação."
    end
  end 

end
