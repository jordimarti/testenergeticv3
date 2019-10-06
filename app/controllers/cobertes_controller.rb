class CobertesController < ApplicationController
  include ApplicationHelper
  include ComponentCobertesHelper
  before_action :set_coberta, only: [:edit, :update, :destroy]
  before_action :set_entitat, only: [:edit, :update, :destroy]

  def new
    entitat = Entitat.find(params[:entitat_id])
    @coberta = Coberta.new
    @coberta.entitat_id = entitat.id
    @coberta.ambit = entitat.ambit
    @coberta.nom = "Nova coberta"
    @coberta.save
    redirect_to edit_coberta_path(@coberta)
  end

  def edit
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @component_cobertes = ComponentCoberta.where(coberta_id: @coberta.id).order(posicio: :asc)
    @transmitancia = transmitancia_coberta(@coberta.id, false)
    @zona = zona_climatica_cte(@coberta.entitat_id)
    @valor_limit = transmitancia_limit_cobertes_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
  end

  def update
    @coberta.update(coberta_params)
    @coberta.transmitancia_coberta = transmitancia_coberta(@coberta.id, false)
    @coberta.save
    redirect_to entitat_envolupant_path(@entitat)
  end

  def destroy
    @coberta.destroy
    redirect_to entitat_envolupant_path(@entitat)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coberta
      @coberta = Coberta.find(params[:id])
    end

    def set_entitat
      @entitat = Entitat.find(@coberta.entitat_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coberta_params
      params.require(:coberta).permit(:entitat_id, :ambit, :nom, :descripcio, :superficie, :percentatge, :transmitancia_coberta)
    end
end
