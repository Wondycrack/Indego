class ServicesController < ApplicationController
    def index
        @services = Service.all
    end
    
      def show
        @service = Service.find(params[:id])
      end

      def new
        # get a blank service record
        @service = Service.new
      end
    
      def create
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
    
    
      def destroy
        @service.destroy
        redirect_to services_path
      end
    
      private
    
      def set_service
        @service = Service.find(params[:id])
      end

    
      def service_params
        # params[:service] => { name: params[:name].... }
        params.require(:service).permit(:description)
      end
end
