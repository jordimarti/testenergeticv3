class MursController < ApplicationController
  include ComponentMursHelper
  before_action :set_mur, only: [:show, :edit, :update, :destroy]
  before_action :set_entitat, only: [:edit, :update, :destroy]

  # GET /murs
  # GET /murs.json
  def index
    @murs = Mur.all
  end

  # GET /murs/1
  # GET /murs/1.json
  def show
  end

  # GET /murs/new
  def new
    entitat = Entitat.find(params[:entitat_id])
    @mur = Mur.new
    @mur.entitat_id = entitat.id
    @mur.ambit = entitat.ambit
    @mur.nom = "Nou mur"
    @mur.save
    redirect_to edit_mur_path(@mur)
  end

  # GET /murs/1/edit
  def edit
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
    @transmitancia = transmitancia_total(@mur.id, false)
    @zona = zona_climatica_cte(@mur.entitat_id)
    @valor_limit = transmitancia_limit_murs_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
  end

  # POST /murs
  # POST /murs.json
  def create
    @mur = Mur.new(mur_params)

    respond_to do |format|
      if @mur.save
        format.html { redirect_to @mur, notice: 'Mur was successfully created.' }
        format.json { render :show, status: :created, location: @mur }
      else
        format.html { render :new }
        format.json { render json: @mur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /murs/1
  # PATCH/PUT /murs/1.json
  def update
    respond_to do |format|
      if @mur.update(mur_params)
        format.html { redirect_to entitat_envolupant_path(@entitat), notice: 'Mur was successfully updated.' }
        format.json { render :show, status: :ok, location: @mur }
      else
        format.html { render :edit }
        format.json { render json: @mur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /murs/1
  # DELETE /murs/1.json
  def destroy
    @mur.destroy
    respond_to do |format|
      format.html { redirect_to entitat_envolupant_path(@entitat), notice: 'Mur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mur
      @mur = Mur.find(params[:id])
    end

    def set_entitat
      @entitat = Entitat.find(@mur.entitat_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mur_params
      params.require(:mur).permit(:entitat_id, :ambit, :nom, :descripcio, :superficie, :tipus_mur, :percentatge)
    end
end
