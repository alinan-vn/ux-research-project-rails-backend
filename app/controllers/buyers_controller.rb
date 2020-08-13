class BuyersController < ApplicationController
  wrap_parameters format: :json
  wrap_parameters :buyer, include: [:first_name, :last_name, :password, :email]
  # before_action :set_buyer, only: [:show, :edit, :update, :destroy]

  def index
    render json: Buyer.all
  end

  def show
    buyer = Buyer.find_by(id: params[:id])
    render json: buyer, except: :password_digest
  end

  def new
  end

  def edit
  end

  def create
    buyer = Buyer.new(buyer_params)

    if buyer.valid?
      buyer.save

      # payload = { id: buyer.id }
      # hmac_secret = 'secret'
      # token = JWT.encode(payload, hmac_secret, 'HS256')

      # render json: { id: buyer.id, first_name: buyer.first_name, token: token }
      render json: { msg: 'succefully created buyer!', buyer: buyer}
    else
      render json: { error: 'failed to create buyer: invalid email or password', buyer: buyer}
    end

  end

  def update
    buyer = Buyer.find_by(id: params[:id])
    buyer.update(buyer_params)

    render json: buyer
  end

  def destroy
    buyer = Buyer.delete(params[:id])
    render json: buyer
  end

  private
    # Only allow a list of trusted parameters through.
  def buyer_params
    params.require(:buyer).permit(:first_name, :last_name, :password, :email)
  end
end