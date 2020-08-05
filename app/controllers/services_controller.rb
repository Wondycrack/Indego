class ServicesController < ApplicationController

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def profile
  end

  def create
    @service = Service.new(service_params)
    # @user = User.find(params[:user_id])
    @service.user = current_user
    @service.save
    redirect_to services_path
  end

  private
  def service_params
    params.require(:service).permit(:description, :rate, :speciality, :project_type, :user)
  end
end
