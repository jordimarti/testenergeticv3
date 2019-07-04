class LampadesController < ApplicationController
  before_action :set_lampada, only: [:show, :edit, :update, :destroy]
  #before_action :set_entitat, only: [:index]

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

    respond_to do |format|
      if @lampada.save
        format.html { redirect_to @lampada, notice: 'Lampada was successfully created.' }
        format.json { render :show, status: :created, location: @lampada }
      else
        format.html { render :new }
        format.json { render json: @lampada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampades/1
  # PATCH/PUT /lampades/1.json
  def update
    respond_to do |format|
      if @lampada.update(lampada_params)
        format.html { redirect_to @lampada, notice: 'Lampada was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampada }
      else
        format.html { render :edit }
        format.json { render json: @lampada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampades/1
  # DELETE /lampades/1.json
  def destroy
    @lampada.destroy
    respond_to do |format|
      format.html { redirect_to lampades_url, notice: 'Lampada was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      params.require(:lampada).permit(:entitat_id, :ambit, :tipologia, :descripcio, :numero, :potencia)
    end
end
