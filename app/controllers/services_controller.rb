class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
    @services = Service.all
  end

  def show
    @service = Service.find params[:id]
  end

  def create
    @service = Service.create(service_params)

    if @service
      redirect_to service_path(@service)
    else
      render 'new'
    end
  end

  def edit
    @service = Service.find params[:id]
  end

  def update
    @service = Service.find params[:id]

    if @service.update_attributes(service_params)
      redirect_to service_path(@service)
    else
      render 'new'
    end
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :duration, :price, related_service_ids: [])
  end
end
