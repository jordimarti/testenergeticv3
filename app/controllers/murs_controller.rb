class MursController < ApplicationController
  include ApplicationHelper
  include ComponentMursHelper
  before_action :set_mur, only: [:show, :edit, :update, :destroy]
  before_action :set_entitat, only: [:edit, :update, :destroy]
  
  def new
    entitat = Entitat.find(params[:entitat_id])
    @mur = Mur.new
    @mur.entitat_id = entitat.id
    @mur.ambit = entitat.ambit
    @mur.nom = "Nou mur"
    @mur.superficie = 10
    @mur.save
    redirect_to edit_mur_path(@mur)
  end

  def edit
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
    @transmitancia = transmitancia_mur(@mur.id, false)
    @zona = zona_climatica_cte(@mur.entitat_id)
    @valor_limit = transmitancia_limit_murs_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
  end

  def update
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
    @transmitancia = transmitancia_mur(@mur.id, false)
    @zona = zona_climatica_cte(@mur.entitat_id)
    @valor_limit = transmitancia_limit_murs_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
    
    if @mur.update(mur_params)
      @mur.transmitancia_mur = transmitancia_mur(@mur.id, false)
      @mur.save
      redirect_to entitat_envolupant_path(@entitat)
    else
      render :edit
    end
  end

  def destroy
    @mur.destroy
    redirect_to entitat_envolupant_path(@entitat)
  end

  private
    def set_mur
      @mur = Mur.find(params[:id])
    end

    def set_entitat
      @entitat = Entitat.find(@mur.entitat_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mur_params
      params.require(:mur).permit(:entitat_id, :ambit, :nom, :descripcio, :superficie, :tipus_mur, :percentatge, :transmitancia_mur)
    end
end
