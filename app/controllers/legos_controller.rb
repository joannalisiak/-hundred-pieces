class LegosController < ApplicationController

  before_action :set_lego, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    
    @legos = policy_scope(Lego).order(created_at: :desc)
    if params[:lego_query].present?
      @legos = @legos.search_by_name_and_description(params[:lego_query])
    end
    
    if params[:location_query].present?
      @legos = @legos.near(params[:location_query], 10)
    end

    if params[:min_pieces].present? || params[:max_pieces].present?
      min_pieces = params[:min_pieces].present? ? params[:min_pieces] : 0
      max_pieces = params[:max_pieces].present? ? params[:max_pieces] : 100000
      @legos = @legos.filter_by_pieces(min_pieces, max_pieces)
    end

    if params[:min_price].present? || params[:max_price].present?
      min_price = params[:min_price].present? ? params[:min_price] : 0
      max_price = params[:max_price].present? ? params[:max_price] : 100000
      @legos = @legos.filter_by_price(min_price, max_price)
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

  def filtering_params(params)
    params.slice(:pieces, :price)
  end
end