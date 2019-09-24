class ComponentCobertesController < ApplicationController
  include ApplicationHelper
  include ComponentCobertesHelper
  before_action :set_component_coberta, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def new
    @component_coberta = ComponentCoberta.new
  end

  def edit
  end

  def create
    components_previs = ComponentCoberta.where(coberta_id: component_coberta_params[:coberta_id]).order(posicio: :asc)
    ultim_component = components_previs.last
    @component_coberta = ComponentCoberta.create(component_coberta_params)
    components = ComponentCoberta.where(coberta_id: @component_coberta.coberta_id).order(posicio: :asc)
    if components.count > 1
      posicio_ultim_component = ultim_component.posicio
      @component_coberta.posicio = posicio_ultim_component + 1
    else
      @component_coberta.posicio = 0
    end
    @component_coberta.save
    resultat_calcul = resistencia_termica_component(@component_coberta.id)
    @falten_dades = {resultat: resultat_calcul, nom: @component_coberta.nom}
    @coberta = Coberta.find(@component_coberta.coberta_id)
    @transmitancia = transmitancia_coberta(@coberta.id, resultat_calcul)
    @component_cobertes = ComponentCoberta.where(coberta_id: @coberta.id).order(posicio: :asc)
    @zona = zona_climatica_cte(@coberta.entitat_id)
    @valor_limit = transmitancia_limit_cobertes_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
  end

  def update
    @component_coberta.update(component_coberta_params)
    resultat_calcul = resistencia_termica_component(@component_coberta.id)
    @falten_dades = {resultat: resultat_calcul, nom: @component_coberta.nom}
    @coberta = Coberta.find(@component_coberta.coberta_id)
    @transmitancia = transmitancia_coberta(@coberta.id, resultat_calcul)
    @component_cobertes = ComponentCoberta.where(coberta_id: @coberta.id).order(posicio: :asc)
    @zona = zona_climatica_cte(@coberta.entitat_id)
    @valor_limit = transmitancia_limit_cobertes_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
  end

  # DELETE /component_cobertes/1
  # DELETE /component_cobertes/1.json
  def destroy
    @component_coberta.destroy
    respond_to do |format|
      format.html { redirect_to component_cobertes_url, notice: 'Component coberta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_coberta
      @component_coberta = ComponentCoberta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_coberta_params
      params.require(:component_coberta).permit(:coberta_id, :nom, :conductivitat, :gruix, :resistencia_termica, :posicio)
    end
end
