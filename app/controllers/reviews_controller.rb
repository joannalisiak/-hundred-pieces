class ReviewsController < ApplicationController
    def new
        @review = Review.new
        @booking = Booking.find(params[:booking_id])

    end

    def create
        @booking = Booking.find(params[:booking_id])
        @review = Review.new(review_params)
        @review.booking = @booking
        if @review.save
          redirect_to lego_path(@booking.lego)
        else
          render "legos/show"
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @booking = @review.booking
        @review.destroy
        redirect_to lego_path(@booking.lego)
        end

    private

    def review_params
        params.require(:review).permit(:content, :rating, :booking_id, :lego_id)
    end
end
