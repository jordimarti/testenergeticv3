class LampadesController < ApplicationController
  before_action :set_lampada, only: [:show, :edit, :update, :destroy]
  #before_action :set_entitat, only: [:index]
  respond_to :html, :js

  # GET /lampades
  # GET /lampades.json
  def index
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @lampades = Lampada.all
  end

  # GET /lampades/1
  # GET /lampades/1.json
  def show
  end

  # GET /lampades/new
  def new
    @lampada = Lampada.new
  end

  # GET /lampades/1/edit
  def edit
  end

  # POST /lampades
  # POST /lampades.json
  def create
    @lampada = Lampada.new(lampada_params)
    @lampada.save
    @fluorescents_compactes = Lampada.where(entitat_id: @lampada.entitat_id, tipologia: 'fluorescent_compacte')
    @leds = Lampada.where(entitat_id: @lampada.entitat_id, tipologia: 'led')
    @fluorescents = Lampada.where(entitat_id: @lampada.entitat_id, tipologia: 'fluorescent')
    @halogenes = Lampada.where(entitat_id: @lampada.entitat_id, tipologia: 'halogena')
    @incandescents = Lampada.where(entitat_id: @lampada.entitat_id, tipologia: 'incandescent')
  end

  # PATCH/PUT /lampades/1
  # PATCH/PUT /lampades/1.json
  def update
    @lampada.update(lampada_params)
  end

  # DELETE /lampades/1
  # DELETE /lampades/1.json
  def destroy
    @fluorescents_compactes = Lampada.where(entitat_id: @lampada.entitat_id, tipologia: 'fluorescent_compacte')
    @leds = Lampada.where(entitat_id: @lampada.entitat_id, tipologia: 'led')
    @fluorescents = Lampada.where(entitat_id: @lampada.entitat_id, tipologia: 'fluorescent')
    @halogenes = Lampada.where(entitat_id: @lampada.entitat_id, tipologia: 'halogena')
    @incandescents = Lampada.where(entitat_id: @lampada.entitat_id, tipologia: 'incandescent')
    @lampada.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampada
      @lampada = Lampada.find(params[:id])
    end

    def set_entitat
      @entitat = Entitat.find(@lampada.entitat_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lampada_params
      params.require(:lampada).permit(:entitat_id, :ambit, :tipologia, :descripcio, :numero, :potencia, :hores_mensuals)
    end
end
