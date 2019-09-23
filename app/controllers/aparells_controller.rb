class AparellsController < ApplicationController
  before_action :set_aparell, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @aparells = Aparell.all
  end

  def show
  end

  def new
    @aparell = Aparell.new
  end

  def edit
  end

  def create
    @aparell = Aparell.new(aparell_params)
    @aparell.save
    @aparells = Aparell.where(entitat_id: @aparell.entitat_id)
  end

  def update
    @aparell.update(aparell_params)
    @aparells = Aparell.where(entitat_id: @aparell.entitat_id)
  end

  def destroy
    @aparells = Aparell.where(entitat_id: @aparell.entitat_id)
    @aparell.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aparell
      @aparell = Aparell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aparell_params
      params.require(:aparell).permit(:entitat_id, :ambit, :nom, :descripcio, :potencia, :hores_mensuals, :consum_mensual, :antiguitat, :qualificacio_energetica)
    end
end
