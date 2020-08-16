class ServicesController < ApplicationController
  def index
    render json: Service.all
  end

  def show
    service = Service.find_by(id: params[:id])
    render json: { buyer: service.buyer, service: service }
  end

  def create
    service = params[:service]
    buyer = params[:buyer]
    service = Service.new(buyer: buyer, service: service)

    if service.valid?
      service.save
      render json: { msg: "Service: #{service.title} added!}" buyer: buyer, service: service }
    else
      render json: { error: 'Service could not be added.. :(', attempt: params }
    end
  end

  def update
    service = Service.find_by(id: params[:service][:id])
    test_service = Service.new(service_params)

    if test_service.valid?
      service.update(service_params)
      render json: { msg: "Service: #{service.title} successfully updated!", service: service }
    else
      render json: {error: "Update unsuccessful: #{service.title}", attempt: params}
    end
  end

  def destroy
    service = Service.delete(params[:id])
    render json: service
  end

  private
    def service_params(*args)
      params.require(:service).permit(*args)
    end
end
