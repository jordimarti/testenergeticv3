class ForatPredefinitsController < ApplicationController
  include ForatsHelper
  before_action :set_forat_predefinit, only: [:show, :edit, :update, :destroy]

  # GET /forat_predefinits
  # GET /forat_predefinits.json
  def index
    @forat_predefinits = ForatPredefinit.all
  end

  # GET /forat_predefinits/1
  # GET /forat_predefinits/1.json
  def show
  end

  # GET /forat_predefinits/new
  def new
    @forat_predefinit = ForatPredefinit.new
  end

  # GET /forat_predefinits/1/edit
  def edit
  end

  # POST /forat_predefinits
  # POST /forat_predefinits.json
  def create
    @forat_predefinit = ForatPredefinit.new(forat_predefinit_params)

    respond_to do |format|
      if @forat_predefinit.save
        format.html { redirect_to @forat_predefinit, notice: 'Forat predefinit was successfully created.' }
        format.json { render :show, status: :created, location: @forat_predefinit }
      else
        format.html { render :new }
        format.json { render json: @forat_predefinit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forat_predefinits/1
  # PATCH/PUT /forat_predefinits/1.json
  def update
    respond_to do |format|
      if @forat_predefinit.update(forat_predefinit_params)
        format.html { redirect_to @forat_predefinit, notice: 'Forat predefinit was successfully updated.' }
        format.json { render :show, status: :ok, location: @forat_predefinit }
      else
        format.html { render :edit }
        format.json { render json: @forat_predefinit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forat_predefinits/1
  # DELETE /forat_predefinits/1.json
  def destroy
    @forat_predefinit.destroy
    respond_to do |format|
      format.html { redirect_to forat_predefinits_url, notice: 'Forat predefinit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def afegeix
    forat_predefinit = ForatPredefinit.find(params[:forat_predefinit_id])
    forat = Forat.new
    forat.entitat_id = params[:entitat_id]
    if params[:locale] == 'es'
      forat.nom = forat_predefinit.nom_es
      forat.descripcio = forat_predefinit.descripcio_es
    else
      forat.nom = forat_predefinit.nom_ca
      forat.descripcio = forat_predefinit.descripcio_ca
    end
    forat.numero = 1
    forat.tipus_marc = forat_predefinit.tipus_marc
    forat.superficie_marc = forat_predefinit.superficie_marc
    forat.transmitancia_marc = forat_predefinit.transmitancia_marc
    forat.tipus_vidre = forat_predefinit.tipus_vidre
    forat.superficie_transparent = forat_predefinit.superficie_vidre
    forat.transmitancia_transparent = forat_predefinit.transmitancia_vidre
    forat.longitud_contacte_marc_vidre = forat_predefinit.longitud_contacte_vidre
    forat.transmitancia_global_forat = (forat.superficie_transparent * forat.transmitancia_transparent + forat.superficie_marc * forat.transmitancia_marc + forat.longitud_contacte_marc_vidre * transmitancia_linial_acoplament(forat.tipus_marc, forat.tipus_vidre))/(forat.superficie_marc + forat.superficie_transparent)
    forat.superficie_total = forat.superficie_transparent + forat.superficie_marc
    forat.save
    redirect_to entitat_envolupant_path(params[:entitat_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forat_predefinit
      @forat_predefinit = ForatPredefinit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forat_predefinit_params
      params.require(:forat_predefinit).permit(:entitat_id, :nom, :descripcio, :numero_forats, :tipus_marc, :superficie_marc, :transmitancia_marc, :tipus_vidre, :superficie_vidre, :transmitancia_vidre, :longitud_contacte_vidre)
    end
end
