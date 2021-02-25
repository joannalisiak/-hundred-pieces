class LegosController < ApplicationController

  before_action :set_lego, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:lego_query].present?
      if params[:location_query].present?
        @legos = policy_scope(Lego).order(created_at: :desc)
        @legos.search_by_name_and_description(params[:lego_query]).search_by_location(params[:location_query])
      else
        @legos = policy_scope(Lego).order(created_at: :desc)
        @legos.search_by_name_and_description(params[:lego_query])
      end
    # # where do I implement filering in the controller? where do I display it in the view?
    # elsif
    #   # does it have to be here? what does it do?
    #   @legos = Lego.where(nil)
    #   filtering_params(params).each do |key, value|
    #     # what is a public_send? where is it defined?
    #     @legos = @legos.public_send("filer_by_#{key}", value) if value.present?
    #   end
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