class LegosController < ApplicationController

  before_action :set_lego, only: [:show, :destroy, :edit, :update]

  def index
    @legos = policy_scope(Lego).order.(created_at: :desc)
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
#     authorize @lego
    @lego.update(lego_params)
    redirect_to legos_path(@lego)
  end

  def destroy
    @lego.destroy
    redirect_to legos_path
  end

  private

  def set_lego
    @lego = Lego.find(params[:id])
  end

  def lego_params
    params.require(:lego).permit(:name, :price, :pieces, :description, :photo)
  end
end
