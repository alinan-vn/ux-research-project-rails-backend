class BookmarkedProductsController < ApplicationController
  def index
    render json: BookmarkedProduct.all
  end

  def show
    bookmarked_product = BookmarkedProduct.find_by(id: params[:id])
    render json: { buyer: bookmarked_product.buyer, product: bookmarked_product.product }
  end

  def create
    product = params[:product]
    buyer = params[:buyer]
    bookmarked_product = BookmarkedProduct.new(buyer: buyer, product: product)

    if bookmarked_product.valid?
      bookmarked_product.save
      render json: { msg: "Bookmark for #{product.title} created!}" product: product, bookmarked_product: bookmarked_product }
    else
      render json: { error: 'Bookmark unsuccesful', attempt: params }
    end
  end

  def destroy
    bookmarked_product = BookmarkedProduct.delete(params[:id])
    render json: bookmarked_product
  end

  private
    def bookmarked_product_params(*args)
      params.require(:bookmarked_product).permit(*args)
    end
end
