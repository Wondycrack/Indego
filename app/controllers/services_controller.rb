class ServicesController < ApplicationController

  def index
    if params[:query].present?
      @services = Service.search_by_speciality_description_project_type_user(params[:query])
    else
      @services = Service.all
    end
  end

  def new
    @service = Service.new
  end

  def create
    # @service = service.new(name: params[:name], address: params[:address], rating: params[:rating])
    # new record with values from form
    @service = Service.new(service_params)

    if @service.save
        redirect_to service_path(@service)
    else
        render :new
    end
  end

    def edit
    # form with service info filled out
    @service = service.find(params[:id])
    end


    def update
    @service.update(service_params)
    # redirect to the show page
    redirect_to @service
    end

    def show
      @service = Service.find(params[:id])

    end

    def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
    end

  private

  def service_params
    params.require(:service).permit(:description, :rate, :speciality, :project_type, :user)
  end
end
