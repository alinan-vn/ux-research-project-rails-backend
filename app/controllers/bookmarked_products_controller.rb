class BookmarkedProductsController < ApplicationController
  before_action :set_bookmarked_product, only: [:show, :edit, :update, :destroy]

  # GET /bookmarked_products
  # GET /bookmarked_products.json
  def index
    @bookmarked_products = BookmarkedProduct.all
  end

  # GET /bookmarked_products/1
  # GET /bookmarked_products/1.json
  def show
  end

  # GET /bookmarked_products/new
  def new
    @bookmarked_product = BookmarkedProduct.new
  end

  # GET /bookmarked_products/1/edit
  def edit
  end

  # POST /bookmarked_products
  # POST /bookmarked_products.json
  def create
    @bookmarked_product = BookmarkedProduct.new(bookmarked_product_params)

    respond_to do |format|
      if @bookmarked_product.save
        format.html { redirect_to @bookmarked_product, notice: 'Bookmarked product was successfully created.' }
        format.json { render :show, status: :created, location: @bookmarked_product }
      else
        format.html { render :new }
        format.json { render json: @bookmarked_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarked_products/1
  # PATCH/PUT /bookmarked_products/1.json
  def update
    respond_to do |format|
      if @bookmarked_product.update(bookmarked_product_params)
        format.html { redirect_to @bookmarked_product, notice: 'Bookmarked product was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmarked_product }
      else
        format.html { render :edit }
        format.json { render json: @bookmarked_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarked_products/1
  # DELETE /bookmarked_products/1.json
  def destroy
    @bookmarked_product.destroy
    respond_to do |format|
      format.html { redirect_to bookmarked_products_url, notice: 'Bookmarked product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmarked_product
      @bookmarked_product = BookmarkedProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmarked_product_params
      params.fetch(:bookmarked_product, {})
    end
end
