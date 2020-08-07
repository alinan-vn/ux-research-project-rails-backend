class BookmarkedServicesController < ApplicationController
  before_action :set_bookmarked_service, only: [:show, :edit, :update, :destroy]

  # GET /bookmarked_services
  # GET /bookmarked_services.json
  def index
    @bookmarked_services = BookmarkedService.all
  end

  # GET /bookmarked_services/1
  # GET /bookmarked_services/1.json
  def show
  end

  # GET /bookmarked_services/new
  def new
    @bookmarked_service = BookmarkedService.new
  end

  # GET /bookmarked_services/1/edit
  def edit
  end

  # POST /bookmarked_services
  # POST /bookmarked_services.json
  def create
    @bookmarked_service = BookmarkedService.new(bookmarked_service_params)

    respond_to do |format|
      if @bookmarked_service.save
        format.html { redirect_to @bookmarked_service, notice: 'Bookmarked service was successfully created.' }
        format.json { render :show, status: :created, location: @bookmarked_service }
      else
        format.html { render :new }
        format.json { render json: @bookmarked_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarked_services/1
  # PATCH/PUT /bookmarked_services/1.json
  def update
    respond_to do |format|
      if @bookmarked_service.update(bookmarked_service_params)
        format.html { redirect_to @bookmarked_service, notice: 'Bookmarked service was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmarked_service }
      else
        format.html { render :edit }
        format.json { render json: @bookmarked_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarked_services/1
  # DELETE /bookmarked_services/1.json
  def destroy
    @bookmarked_service.destroy
    respond_to do |format|
      format.html { redirect_to bookmarked_services_url, notice: 'Bookmarked service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmarked_service
      @bookmarked_service = BookmarkedService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmarked_service_params
      params.fetch(:bookmarked_service, {})
    end
end
