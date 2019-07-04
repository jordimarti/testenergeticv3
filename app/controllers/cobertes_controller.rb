class CobertesController < ApplicationController
  before_action :set_coberta, only: [:show, :edit, :update, :destroy]

  # GET /cobertes
  # GET /cobertes.json
  def index
    @cobertes = Coberta.all
  end

  # GET /cobertes/1
  # GET /cobertes/1.json
  def show
  end

  # GET /cobertes/new
  def new
    @coberta = Coberta.new
  end

  # GET /cobertes/1/edit
  def edit
  end

  # POST /cobertes
  # POST /cobertes.json
  def create
    @coberta = Coberta.new(coberta_params)

    respond_to do |format|
      if @coberta.save
        format.html { redirect_to @coberta, notice: 'Coberta was successfully created.' }
        format.json { render :show, status: :created, location: @coberta }
      else
        format.html { render :new }
        format.json { render json: @coberta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cobertes/1
  # PATCH/PUT /cobertes/1.json
  def update
    respond_to do |format|
      if @coberta.update(coberta_params)
        format.html { redirect_to @coberta, notice: 'Coberta was successfully updated.' }
        format.json { render :show, status: :ok, location: @coberta }
      else
        format.html { render :edit }
        format.json { render json: @coberta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cobertes/1
  # DELETE /cobertes/1.json
  def destroy
    @coberta.destroy
    respond_to do |format|
      format.html { redirect_to cobertes_url, notice: 'Coberta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coberta
      @coberta = Coberta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coberta_params
      params.require(:coberta).permit(:entitat_id, :ambit, :nom, :descripcio, :superficie, :percentatge)
    end
end
