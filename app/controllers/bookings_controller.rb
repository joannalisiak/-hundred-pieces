class BookingsController < ApplicationController

  before_action :set_booking, only: %i[show edit update destroy]
    def index
      @user_bookings = current_user.bookings
      @bookings = Booking.all
    end

    def create
    @booking = Booking.new(booking_params)
    @lego = Lego.find(params[:lego_id])
    @booking.lego = @lego
    @booking.user = current_user
    if @booking.save
        redirect_to booking_path(@booking)
      else
        render "legos/show"
      end
    end

    def show
    end

    def edit
      respond_to do |format|
        format.js
      end
    end

    def update
      @booking.update(booking_params)
       redirect_to bookings_path
    end

    def destroy
      @booking.destroy
      redirect_to bookings_path
    end

    private

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:start_date, :end_date)
    end
end
