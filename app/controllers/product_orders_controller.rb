class ProductOrdersController < ApplicationController
  def index
    render json: ProductOrder.all
  end

  def show
    product_order = ProductOrder.find_by(id: params[:id])
    render json: { buyer: product_order.buyer, product: product_order.product }
  end

  def create
    product = params[:product]
    buyer = params[:buyer]
    product_order = ProductOrder.new(buyer: buyer, product: product)

    if product_order.valid?
      product_order.save
      render json: { msg: "Product Order successful: #{product.title}!" product: product, product_order: product_order }
    else
      render json: { error: 'Bookmark unsuccessful', attempt: params }
    end
  end

  # Probably not needed for this table
  # def destroy
  #   product_order = ProductOrder.delete(params[:id])
  #   render json: product_order
  # end

  private
    def product_order_params(*args)
      params.require(:product_order).permit(*args)
    end
end
