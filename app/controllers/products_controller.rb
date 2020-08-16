class ProductsController < ApplicationController
  def index
    render json: Product.all
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: { buyer: product.buyer, product: product }
  end

  def create
    product = params[:product]
    buyer = params[:buyer]
    product = Product.new(buyer: buyer, product: product)

    if product.valid?
      product.save
      render json: { msg: "Product: #{product.title} added!}" buyer: buyer, product: product }
    else
      render json: { error: 'Product could not be added.. :(', attempt: params }
    end
  end

  def update
    product = Product.find_by(id: params[:product][:id])
    test_product = Product.new(product_params)

    if test_product.valid?
      product.update(product_params)
      render json: { msg: "Product: #{product.title} successfully updated!", product: product }
    else
      render json: {error: "Update unsuccessful: #{product.title}", attempt: params}
    end
  end

  def destroy
    product = Product.delete(params[:id])
    render json: product
  end

  private
    def product_params(*args)
      params.require(:product).permit(*args)
    end
end
