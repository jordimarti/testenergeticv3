class ComponentMursController < ApplicationController
  include ApplicationHelper
  include ComponentMursHelper
  before_action :set_component_mur, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def new
    @component_mur = ComponentMur.new
  end

  def edit
  end

  def create
    components_previs = ComponentMur.where(mur_id: component_mur_params[:mur_id]).order(posicio: :asc)
    ultim_component = components_previs.last
    @component_mur = ComponentMur.create(component_mur_params)
    components = ComponentMur.where(mur_id: @component_mur.mur_id).order(posicio: :asc)
    if components.count > 1
      posicio_ultim_component = ultim_component.posicio
      @component_mur.posicio = posicio_ultim_component + 1
    else
      @component_mur.posicio = 0
    end
    @component_mur.save
    resultat_calcul = resistencia_termica_component(@component_mur.id)
    @falten_dades = {resultat: resultat_calcul, nom: @component_mur.nom}
    @mur = Mur.find(@component_mur.mur_id)
    @transmitancia = transmitancia_mur(@mur.id, resultat_calcul)
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
    @zona = zona_climatica_cte(@mur.entitat_id)
    @valor_limit = transmitancia_limit_murs_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
  end

  def update
    @component_mur.update(component_mur_params)
    resultat_calcul = resistencia_termica_component(@component_mur.id)
    @falten_dades = {resultat: resultat_calcul, nom: @component_mur.nom}
    @mur = Mur.find(@component_mur.mur_id)
    @transmitancia = transmitancia_mur(@mur.id, resultat_calcul)
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
    @zona = zona_climatica_cte(@mur.entitat_id)
    @valor_limit = transmitancia_limit_murs_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
  end

  def destroy
    @mur = Mur.find(params[:mur_id])
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
    @component_mur.destroy
    @transmitancia = transmitancia_mur(@mur.id, false)
    @zona = zona_climatica_cte(@mur.entitat_id)
    @valor_limit = transmitancia_limit_murs_cte(@zona)
    if @transmitancia > @valor_limit
      @supera_transmitancia_limit = true
    else
      @supera_transmitancia_limit = false
    end
  end

  def canviar_posicio
    reordenar_component(params[:component_id])
    @component_mur = ComponentMur.find(params[:component_id])
    @mur = Mur.find(@component_mur.mur_id)
    @component_murs = ComponentMur.where(mur_id: @mur.id).order(posicio: :asc)
  end

  def select
    @component_predefinit_murs = ComponentPredefinit.where(familia: params[:familia])
  end

  def afegeix
    component_predefinit = ComponentPredefinit.find(params[:component_predefinit_id])
    component = ComponentMur.new
    component.mur_id = params[:mur_id]
    if params[:locale] == 'es'
      component.nom = component_predefinit.nom_es
    else
      component.nom = component_predefinit.nom_ca
    end
    component.conductivitat = component_predefinit.conductivitat
    component.gruix = component_predefinit.gruix
    component.resistencia_termica = component.gruix/component.conductivitat
    #Abans de guardar hem de saber la posició que li toca
    ultim_component = ComponentMur.where(mur_id: params[:mur_id]).order(posicio: :asc).last
    if ultim_component.present?
      posicio_ultim_component = ultim_component.posicio
      component.posicio = posicio_ultim_component + 1
    else
      component.posicio = 0
    end
    component.save
    @component_murs = ComponentMur.where(mur_id: params[:mur_id]).order(posicio: :asc)
    @mur = Mur.find(params[:mur_id])
  end

  private
    def set_component_mur
      @component_mur = ComponentMur.find(params[:id])
    end

    def component_mur_params
      params.require(:component_mur).permit(:mur_id, :nom, :conductivitat, :gruix, :resistencia_termica, :posicio)
    end
end
