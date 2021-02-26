class LegosController < ApplicationController

  before_action :set_lego, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = " \
        legos.name @@ :query \
        OR legos.description @@ :query \
        "
    else
      @legos = policy_scope(Lego).order(created_at: :desc)
    end
    @markers = @legos.geocoded.map do |lego|
      {
        lat: lego.latitude,
        lng: lego.longitude
      }
    end
  end

  def show
    authorize @lego
    @booking = Booking.new
    # @review = Review.new
  end

  def new
    @lego = Lego.new
    authorize @lego
  end

  def create
    @lego = Lego.new(lego_params)
    @lego.user = current_user
    authorize @lego
    if @lego.save
      redirect_to lego_path(@lego)
    else
      render :new
    end
  end

  def edit
    authorize @lego
  end

  def update
    @lego.update(lego_params)
    authorize @lego
    redirect_to lego_path(@lego)
  end

  def destroy
    @lego.destroy
    authorize @lego
    redirect_to legos_path
  end

  private

  def set_lego
    @lego = Lego.find(params[:id])
  end

  def lego_params
    params.require(:lego).permit(:name, :price, :pieces, :description, :address, :photo)
  end
end