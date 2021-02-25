class BookingsController < ApplicationController
    def index
        @bookings = Booking.all
        # list all the bookings of a user
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
    @booking = Booking.find(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def booking_params
        params.require(:booking).permit(:start_date, :end_date)
      end
end
