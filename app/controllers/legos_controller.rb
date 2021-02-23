class LegosController < ApplicationController
  before_action :set_lego, only: [:show]
  def index
    @legos = Lego.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_lego
    @legos = Lego.find(params[:id])
  end
end
