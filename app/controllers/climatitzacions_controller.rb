class ClimatitzacionsController < ApplicationController
  before_action :set_climatitzacio, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /climatitzacions
  # GET /climatitzacions.json
  def index
    @climatitzacions = Climatitzacio.all
  end

  # GET /climatitzacions/1
  # GET /climatitzacions/1.json
  def show
  end

  # GET /climatitzacions/new
  def new
    @climatitzacio = Climatitzacio.new
  end

  # GET /climatitzacions/1/edit
  def edit
  end

  # POST /climatitzacions
  # POST /climatitzacions.json
  def create
    @climatitzacio = Climatitzacio.new(climatitzacio_params)

    respond_to do |format|
      if @climatitzacio.save
        format.html { redirect_to @climatitzacio, notice: 'Climatitzacio was successfully created.' }
        format.json { render :show, status: :created, location: @climatitzacio }
      else
        format.html { render :new }
        format.json { render json: @climatitzacio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @climatitzacio.update(climatitzacio_params)
    @clima = Climatitzacio.find(@climatitzacio.id)
  end

  # DELETE /climatitzacions/1
  # DELETE /climatitzacions/1.json
  def destroy
    @climatitzacio.destroy
    respond_to do |format|
      format.html { redirect_to climatitzacions_url, notice: 'Climatitzacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climatitzacio
      @climatitzacio = Climatitzacio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climatitzacio_params
      params.require(:climatitzacio).permit(:entitat_id, :ambit, :tipologia_acs, :tipologia_calefaccio_1, :tipologia_calefaccio_2, :tipologia_refrigeracio, :generacio, :percentatge_captadors_termics, :antiguitat_acs, :antiguitat_calefaccio_1, :antiguitat_calefaccio_2, :antiguitat_refrigeracio, :antiguitat_generacio)
    end
end
