class ComponentPredefinitMursController < ApplicationController
  before_action :set_component_predefinit_mur, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /component_predefinit_murs
  # GET /component_predefinit_murs.json
  def index
    @component_predefinit_murs = ComponentPredefinitMur.all
  end

  # GET /component_predefinit_murs/1
  # GET /component_predefinit_murs/1.json
  def show
  end

  # GET /component_predefinit_murs/new
  def new
    @component_predefinit_mur = ComponentPredefinitMur.new
  end

  # GET /component_predefinit_murs/1/edit
  def edit
  end

  # POST /component_predefinit_murs
  # POST /component_predefinit_murs.json
  def create
    @component_predefinit_mur = ComponentPredefinitMur.new(component_predefinit_mur_params)

    respond_to do |format|
      if @component_predefinit_mur.save
        format.html { redirect_to @component_predefinit_mur, notice: 'Component predefinit mur was successfully created.' }
        format.json { render :show, status: :created, location: @component_predefinit_mur }
      else
        format.html { render :new }
        format.json { render json: @component_predefinit_mur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /component_predefinit_murs/1
  # PATCH/PUT /component_predefinit_murs/1.json
  def update
    respond_to do |format|
      if @component_predefinit_mur.update(component_predefinit_mur_params)
        format.html { redirect_to @component_predefinit_mur, notice: 'Component predefinit mur was successfully updated.' }
        format.json { render :show, status: :ok, location: @component_predefinit_mur }
      else
        format.html { render :edit }
        format.json { render json: @component_predefinit_mur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_predefinit_murs/1
  # DELETE /component_predefinit_murs/1.json
  def destroy
    @component_predefinit_mur.destroy
    respond_to do |format|
      format.html { redirect_to component_predefinit_murs_url, notice: 'Component predefinit mur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select
    @component_predefinit_murs = ComponentPredefinitMur.where(familia: params[:familia])
  end

  def afegeix
    component_predefinit = ComponentPredefinitMur.find(params[:component_predefinit_mur_id])
    component = ComponentMur.new
    component.mur_id = params[:mur_id]
    component.nom = component_predefinit.nom
    component.conductivitat = component_predefinit.conductivitat
    component.gruix = component_predefinit.gruix
    component.resistencia_termica = component.gruix/component.conductivitat
    component.save
    @component_murs = ComponentMur.where(mur_id: params[:mur_id]).order(posicio: :asc)
    @mur = Mur.find(params[:mur_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_predefinit_mur
      @component_predefinit_mur = ComponentPredefinitMur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_predefinit_mur_params
      params.require(:component_predefinit_mur).permit(:familia, :nom, :conductivitat, :densitat, :gruix, :resistencia_termica)
    end
end
