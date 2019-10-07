class ComponentPredefinitsController < ApplicationController
  before_action :set_component_predefinit, only: [:show, :edit, :update, :destroy]

  # GET /component_predefinits
  # GET /component_predefinits.json
  def index
    @component_predefinits = ComponentPredefinit.all
  end

  # GET /component_predefinits/1
  # GET /component_predefinits/1.json
  def show
  end

  # GET /component_predefinits/new
  def new
    @component_predefinit = ComponentPredefinit.new
  end

  # GET /component_predefinits/1/edit
  def edit
  end

  # POST /component_predefinits
  # POST /component_predefinits.json
  def create
    @component_predefinit = ComponentPredefinit.new(component_predefinit_params)

    respond_to do |format|
      if @component_predefinit.save
        format.html { redirect_to @component_predefinit, notice: 'Component predefinit was successfully created.' }
        format.json { render :show, status: :created, location: @component_predefinit }
      else
        format.html { render :new }
        format.json { render json: @component_predefinit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /component_predefinits/1
  # PATCH/PUT /component_predefinits/1.json
  def update
    respond_to do |format|
      if @component_predefinit.update(component_predefinit_params)
        format.html { redirect_to @component_predefinit, notice: 'Component predefinit was successfully updated.' }
        format.json { render :show, status: :ok, location: @component_predefinit }
      else
        format.html { render :edit }
        format.json { render json: @component_predefinit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_predefinits/1
  # DELETE /component_predefinits/1.json
  def destroy
    @component_predefinit.destroy
    respond_to do |format|
      format.html { redirect_to component_predefinits_url, notice: 'Component predefinit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_predefinit
      @component_predefinit = ComponentPredefinit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_predefinit_params
      params.require(:component_predefinit).permit(:familia, :nom, :conductivitat, :densitat, :gruix, :resistencia_termica)
    end
end
