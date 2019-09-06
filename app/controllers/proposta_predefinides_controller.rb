class PropostaPredefinidesController < ApplicationController
  before_action :set_proposta_predefinida, only: [:show, :edit, :update, :destroy]

  # GET /proposta_predefinides
  # GET /proposta_predefinides.json
  def index
    @proposta_predefinides = PropostaPredefinida.all
  end

  # GET /proposta_predefinides/1
  # GET /proposta_predefinides/1.json
  def show
  end

  # GET /proposta_predefinides/new
  def new
    @proposta_predefinida = PropostaPredefinida.new
  end

  # GET /proposta_predefinides/1/edit
  def edit
  end

  # POST /proposta_predefinides
  # POST /proposta_predefinides.json
  def create
    @proposta_predefinida = PropostaPredefinida.new(proposta_predefinida_params)

    respond_to do |format|
      if @proposta_predefinida.save
        format.html { redirect_to @proposta_predefinida, notice: 'Proposta predefinida was successfully created.' }
        format.json { render :show, status: :created, location: @proposta_predefinida }
      else
        format.html { render :new }
        format.json { render json: @proposta_predefinida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposta_predefinides/1
  # PATCH/PUT /proposta_predefinides/1.json
  def update
    respond_to do |format|
      if @proposta_predefinida.update(proposta_predefinida_params)
        format.html { redirect_to @proposta_predefinida, notice: 'Proposta predefinida was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposta_predefinida }
      else
        format.html { render :edit }
        format.json { render json: @proposta_predefinida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposta_predefinides/1
  # DELETE /proposta_predefinides/1.json
  def destroy
    @proposta_predefinida.destroy
    respond_to do |format|
      format.html { redirect_to proposta_predefinides_url, notice: 'Proposta predefinida was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposta_predefinida
      @proposta_predefinida = PropostaPredefinida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposta_predefinida_params
      params.require(:proposta_predefinida).permit(:codi, :mesura, :a-b3, :a-c2, :a-d1, :a-d2, :a-d3, :a-e1, :b-b3, :b-c2, :b-d1, :b-d2, :b-d3, :b-e1, :c-b3, :c-c2, :c-d1, :c-d2, :c-d3, :c-e1, :d-b3, :d-c2, :d-d1, :d-d2, :d-d3, :d-e1, :e-b3, :e-c2, :e-d1, :e-d2, :e-d3, :e-e1, :f-b3, :f-c2, :f-d1, :f-d2, :f-d3, :f-e1, :g-b3, :g-c2, :g-d1, :g-d2, :g-d3, :g-e1, :h-b3, :h-c2, :h-d1, :h-d2, :h-d3, :h-e1, :i-b3, :i-c2, :i-d1, :i-d2, :i-d3, :i-e1, :preu, :tipus_proposta, :descripcio)
    end
end
