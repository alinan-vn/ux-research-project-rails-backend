class ServiceOrdersController < ApplicationController
  def index
    render json: ServiceOrder.all
  end

  def show
    service_order = ServiceOrder.find_by(id: params[:id])
    render json: { buyer: service_order.buyer, service: service_order.service }
  end

  def create
    service = params[:service]
    buyer = params[:buyer]
    service_order = ServiceOrder.new(buyer: buyer, service: service)

    if service_order.valid?
      service_order.save
      render json: { msg: "Service Order successful: #{service.title}!" service: service, service_order: service_order }
    else
      render json: { error: 'Bookmark unsuccessful', attempt: params }
    end
  end

  # Probably not needed for this table
  # def destroy
  #   service_order = ServiceOrder.delete(params[:id])
  #   render json: service_order
  # end

  private
    def service_order_params(*args)
      params.require(:service_order).permit(*args)
    end
end
