class BookingsController < ApplicationController


  # before_action , only: [:new, :create]
  def index
    @bookings = Booking.all
    @user = current_user
  end


  def new
    @booking = Booking.new
    @service = Service.find(params[:service_id])
    # @user = current_user
  end

  def create

    # service = Service.find(params[:service_id])
    start = Time.now
    @booking = Booking.new(start_date: Time.now, end_date: Time.now, user_id: current_user.id, service_id: params[:service_id])
    @user = current_user
    puts @booking

    if @booking.save
      puts "booking.saveeeee"
        redirect_to bookings_path(@booking)
    else
        render :new
    end

  end

  def show

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
    end
  # def booking_params
  #   params.require(:booking).permit(:user_id, :service_id)
  # end
end
