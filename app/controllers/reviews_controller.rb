class ReviewsController < ApplicationController
    def new
        @review = Review.new
        @booking = Booking.find(params[:booking_id])
    end

    def create
        @review = Review.new(review_params)
        @booking = Booking.find(params[:booking_id])
        @review.booking = @booking

        if @review.save
          redirect_to lego_path(@booking.lego)
        else
          render "new"
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @booking = @review.booking
        @review.destroy
        redirect_to lego_path(@booking.lego))
        end

    private

    def review_params
        params.require(:review).permit(:content, :rating, :booking_id)
    end
end
