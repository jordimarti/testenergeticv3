class ConsumGlobalsController < ApplicationController
  before_action :set_consum_global, only: [:show, :edit, :update, :destroy]

  # GET /consum_globals
  # GET /consum_globals.json
  def index
    @consum_globals = ConsumGlobal.all
  end

  # GET /consum_globals/1
  # GET /consum_globals/1.json
  def show
  end

  # GET /consum_globals/new
  def new
    @consum_global = ConsumGlobal.new
  end

  # GET /consum_globals/1/edit
  def edit
  end

  # POST /consum_globals
  # POST /consum_globals.json
  def create
    @consum_global = ConsumGlobal.new(consum_global_params)

    respond_to do |format|
      if @consum_global.save
        format.html { redirect_to entitat_consums_path(@consum_global.entitat_id), notice: 'Consum global was successfully created.' }
        format.json { render :show, status: :created, location: @consum_global }
      else
        format.html { render :new }
        format.json { render json: @consum_global.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consum_globals/1
  # PATCH/PUT /consum_globals/1.json
  def update
    respond_to do |format|
      if @consum_global.update(consum_global_params)
        format.html { redirect_to entitat_consums_path(@consum_global.entitat_id), notice: 'Consum global was successfully updated.' }
        format.json { render :show, status: :ok, location: @consum_global }
      else
        format.html { render :edit }
        format.json { render json: @consum_global.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consum_globals/1
  # DELETE /consum_globals/1.json
  def destroy
    @consum_global.destroy
    respond_to do |format|
      format.html { redirect_to consum_globals_url, notice: 'Consum global was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consum_global
      @consum_global = ConsumGlobal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consum_global_params
      params.require(:consum_global).permit(:entitat_id, :ambit, :consum_anual_electricitat, :consum_anual_gas, :consum_anual_gasoil, :despesa_anual_electricitat, :despesa_anual_gas, :despesa_anual_gasoil)
    end
end
