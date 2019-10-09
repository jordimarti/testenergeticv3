class CertificacionsController < ApplicationController
  before_action :set_certificacio, only: [:show, :edit, :update, :destroy]

  # GET /certificacions
  # GET /certificacions.json
  def index
    @certificacions = Certificacio.all
  end

  # GET /certificacions/1
  # GET /certificacions/1.json
  def show
  end

  # GET /certificacions/new
  def new
    @certificacio = Certificacio.new
  end

  # GET /certificacions/1/edit
  def edit
  end

  # POST /certificacions
  # POST /certificacions.json
  def create
    @certificacio = Certificacio.new(certificacio_params)

    respond_to do |format|
      if @certificacio.save
        format.html { redirect_to @certificacio, notice: 'Certificacio was successfully created.' }
        format.json { render :show, status: :created, location: @certificacio }
      else
        format.html { render :new }
        format.json { render json: @certificacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificacions/1
  # PATCH/PUT /certificacions/1.json
  def update
    respond_to do |format|
      if @certificacio.update(certificacio_params)
        format.html { redirect_to entitat_certificacio_path(@certificacio.entitat_id), notice: 'Certificacio was successfully updated.' }
        format.json { render :show, status: :ok, location: @certificacio }
      else
        format.html { render :edit }
        format.json { render json: @certificacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificacions/1
  # DELETE /certificacions/1.json
  def destroy
    @certificacio.destroy
    respond_to do |format|
      format.html { redirect_to certificacions_url, notice: 'Certificacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificacio
      @certificacio = Certificacio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificacio_params
      params.require(:certificacio).permit(:entitat_id, :ambit, :visible, :emissions, :demanda, :lletra_emissions, :lletra_demanda)
    end
end
