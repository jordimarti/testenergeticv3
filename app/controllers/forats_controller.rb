class ForatsController < ApplicationController
  before_action :set_forat, only: [:show, :edit, :update, :destroy]
  before_action :set_entitat, only: [:edit, :update, :destroy]

  # GET /forats
  # GET /forats.json
  def index
    @forats = Forat.all
  end

  # GET /forats/1
  # GET /forats/1.json
  def show
  end

  # GET /forats/new
  def new
    entitat = Entitat.find(params[:entitat_id])
    @forat = Forat.new
    @forat.entitat_id = entitat.id
    @forat.ambit = entitat.ambit
    @forat.nom = "Nou forat"
    @forat.save
    redirect_to edit_forat_path(@forat)
  end

  # GET /forats/1/edit
  def edit
    @subnavigation = true
    @submenu_actiu = 'aixecament'
  end

  # POST /forats
  # POST /forats.json
  def create
    @forat = Forat.new(forat_params)

    respond_to do |format|
      if @forat.save
        format.html { redirect_to @forat, notice: 'Forat was successfully created.' }
        format.json { render :show, status: :created, location: @forat }
      else
        format.html { render :new }
        format.json { render json: @forat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forats/1
  # PATCH/PUT /forats/1.json
  def update
    respond_to do |format|
      if @forat.update(forat_params)
        format.html { redirect_to entitat_envolupant_path(@entitat), notice: 'Forat was successfully updated.' }
        format.json { render :show, status: :ok, location: @forat }
      else
        format.html { render :edit }
        format.json { render json: @forat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forats/1
  # DELETE /forats/1.json
  def destroy
    @forat.destroy
    respond_to do |format|
      format.html { redirect_to forats_url, notice: 'Forat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forat
      @forat = Forat.find(params[:id])
    end

    def set_entitat
      @entitat = Entitat.find(@forat.entitat_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forat_params
      params.require(:forat).permit(:entitat_id, :ambit, :nom, :descripcio, :superficie, :part_opaca, :part_transparent, :transmitancia_part_opaca, :transmitancia_part_transparent, :nom_part_opaca, :nom_part_transparent, :numero, :percentatge)
    end
end
