class SellersController < ApplicationController
  bwrap_parameters format: :json
  wrap_parameters :seller, include: [:first_name, :last_name, :password, :email]
  # before_action :set_buyer, only: [:show, :edit, :update, :destroy]

  def index
    render json: Seller.all
  end

  def show
    seller = Seller.find_by(id: params[:id])
    render json: seller, except: :password_digest
  end

  def new
  end

  def edit
  end

  def create
    seller = Seller.new(seller_params)

    if seller.valid?
      seller.save

      # payload = { id: seller.id }
      # hmac_secret = 'secret'
      # token = JWT.encode(payload, hmac_secret, 'HS256')

      # render json: { id: seller.id, first_name: seller.first_name, token: token }
      render json: { msg: 'succefully created buyer!', seller: seller}
    else
      render json: { error: 'failed to create seller: invalid email or password', seller: seller}
    end

  end

  def update
    seller = Seller.find_by(id: params[:id])
    seller.update(seller_params)

    render json: seller
  end

  def destroy
    seller = Seller.delete(params[:id])
    render json: seller
  end

  private
    # Only allow a list of trusted parameters through.
  def seller_params
    params.require(:seller).permit(:first_name, :last_name, :password, :email)
  end
end
