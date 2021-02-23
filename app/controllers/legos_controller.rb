class LegosController < ApplicationController
  before_action :set_lego, only: [:show]
  def index
    @legos = Lego.all
  end

  def show
  end

  def new
    @lego = Lego.new
  end

  def create
    @lego = Lego.new(lego_params)
    @lego.user = current_user
    if @lego.save
      redirect_to lego_path(@lego)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_lego
    @lego = Lego.find(params[:id])
  end

  def lego_params
    params.require(:lego).permit(:name, :price, :pieces, :description, :photo)
  end
end
