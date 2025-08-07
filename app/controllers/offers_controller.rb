class OffersController < ApplicationController
  def index
    @offers = Offer.includes(:product, :user).all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @offer = Offer.new
  end

  def create
    @product = Product.find(params[:product_id])
    @offer = @product.offers.build(offer_params)
    @offer.user = current_user

    if @offer.save
      redirect_to offer_path(@offer), notice: "Oferta criada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:price)
  end
end
