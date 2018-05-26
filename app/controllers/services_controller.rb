class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
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

  private

  def service_params
    params.require(:service).permit(:title, :description, :duration, :price)
  end
end
