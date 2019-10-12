class TerresController < ApplicationController
  include TerresHelper
  before_action :set_terra, only: [:edit, :update, :destroy]
  before_action :set_entitat, only: [:edit, :update, :destroy]

  def new
    entitat = Entitat.find(params[:entitat_id])
    @terra = Terra.new
    @terra.entitat_id = entitat.id
    @terra.ambit = entitat.ambit
    @terra.nom = "Nou terra"
    @terra.save
    redirect_to edit_terra_path(@terra)
  end

  def edit
    @subnavigation = true
    @submenu_actiu = 'aixecament'
  end

  def update
    @subnavigation = true
    @submenu_actiu = 'aixecament'

    if @terra.update(terra_params)
      @terra.transmitancia_terra = transmitancia_terra(@terra)
      @terra.save
      redirect_to entitat_envolupant_path(@entitat)
    else
      render :edit
    end
  end

  def destroy
    @terra.destroy
    redirect_to entitat_envolupant_path(@entitat)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_terra
      @terra = Terra.find(params[:id])
    end

    def set_entitat
      @entitat = Entitat.find(@terra.entitat_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def terra_params
      params.require(:terra).permit(:entitat_id, :ambit, :nom, :descripcio, :superficie, :percentatge, :transmitancia_terra, :profunditat, :resistencia_termica_aillant, :longitud_perimetre, :ample_aillament, :valor)
    end
end
