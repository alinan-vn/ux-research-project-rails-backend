class BookmarkedServicesController < ApplicationController
  def index
    render json: BookmarkedService.all
  end

  def show
    bookmarked_service = BookmarkedService.find_by(id: params[:id])
    render json: { buyer: bookmarked_service.buyer, service: bookmarked_service.service }
  end

  def create
    service = params[:service]
    buyer = params[:buyer]
    bookmarked_service = BookmarkedService.new(buyer: buyer, service: service)

    if bookmarked_service.valid?
      bookmarked_service.save
      render json: { msg: "Bookmark for #{service.title} created!}" service: service, bookmarked_service: bookmarked_service }
    else
      render json: { error: 'Bookmark unsuccesful', attempt: params }
    end
  end

  def destroy
    bookmarked_service = BookmarkedService.delete(params[:id])
    render json: bookmarked_service
  end

  private
    def bookmarked_service_params(*args)
      params.require(:bookmarked_service).permit(*args)
    end
end
