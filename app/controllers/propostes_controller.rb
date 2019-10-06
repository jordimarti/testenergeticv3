class PropostesController < ApplicationController
  #Incloem el ComponentMursHelper per a calcular zona climàtica per generar propostes
  include ApplicationHelper
  include ComponentMursHelper
  before_action :set_proposta, only: [:show, :edit, :update, :destroy]
  before_action :set_entitat, only: [:generar_propostes]
  respond_to :html, :js

  def new
    @proposta = Proposta.new
    @proposta.entitat_id = params[:entitat_id]
  end

  def edit
  end

  def create
    @proposta = Proposta.create(proposta_params)
    @propostes = Proposta.where(entitat_id: @proposta.entitat_id).order(created_at: :asc)
  end

  def update
    @proposta.update_attributes(proposta_params)
    @propostes = Proposta.where(entitat_id: @proposta.entitat_id).order(created_at: :asc)
  end

  def destroy
    @propostes = Proposta.where(entitat_id: @proposta.entitat_id).order(created_at: :asc)
    @proposta.destroy
  end

  def generar_propostes
    zona_climatica = zona_climatica_cte(@entitat.id)
    superficie_facana = 300
    lletra = lletra_tipus_habitatge(@entitat)
    if lletra == 'z'
      @missatge = 'No es poden generar propostes automàticament per habitatges tan nous'
    end
    codi = lletra + '_' + zona_climatica
    
    data_any = Date.today.year + 1
    data_mes = 1
    # Aïllament de façana
    proposta_aillament = PropostaPredefinida.find_by(codi: 'P1')
    estalvi = proposta_aillament.send("#{lletra}_#{zona_climatica}")
    cost = proposta_aillament.preu * superficie_facana
    estalvi_optimista = estalvi + (estalvi * 0.15)
    estalvi_pessimista = estalvi - (estalvi * 0.15)
    cost_optimista = cost - (cost * 0.15)
    cost_pessimista = cost + (cost * 0.15)
    Proposta.create(entitat_id: @entitat.id, mesura: proposta_aillament.mesura_ca, descripcio: proposta_aillament.descripcio, cost_optimista: cost_optimista, cost_pessimista: cost_pessimista, estalvi_optimista: estalvi_optimista, estalvi_pessimista: estalvi_pessimista, data_any: data_any, data_mes: data_mes)

    # Canvi finestres
    proposta_finestra = PropostaPredefinida.find_by(codi: 'P58')
    estalvi = proposta_finestra.send("#{lletra}_#{zona_climatica}")
    superficie_finestres = 40
    cost = proposta_finestra.preu * superficie_finestres
    estalvi_optimista = estalvi + (estalvi * 0.15)
    estalvi_pessimista = estalvi - (estalvi * 0.15)
    cost_optimista = cost - (cost * 0.15)
    cost_pessimista = cost + (cost * 0.15)
    Proposta.create(entitat_id: @entitat.id, mesura: proposta_finestra.mesura_ca, descripcio: proposta_finestra.descripcio, cost_optimista: cost_optimista, cost_pessimista: cost_pessimista, estalvi_optimista: estalvi_optimista, estalvi_pessimista: estalvi_pessimista, data_any: data_any, data_mes: data_mes)

    # Canvi caldera
    # Només proposem canvi caldera si es tracta d'habitatge unifamiliar o subentitat
    if @entitat.tipologia == "Unifamiliar"
      proposta_caldera = PropostaPredefinida.find_by(codi: 'A2')
    elsif @entitat.ambit == "subentitat"
      proposta_caldera = PropostaPredefinida.find_by(codi: 'A1')
    else
      # En aquest cas es tracta d'un edifici sencer plurifamiliar, el preu es multiplicarà pel nombre d'entitats
      proposta_caldera = PropostaPredefinida.find_by(codi: 'A1')
      entitats = Entitat.where(pare: @entitat.id)
      proposta_caldera.preu = proposta_caldera.preu * entitats.count
    end
    
    estalvi = proposta_caldera.send("#{lletra}_#{zona_climatica}")
    cost = proposta_caldera.preu
    estalvi_optimista = estalvi + (estalvi * 0.15)
    estalvi_pessimista = estalvi - (estalvi * 0.15)
    cost_optimista = cost - (cost * 0.15)
    cost_pessimista = cost + (cost * 0.15)
    Proposta.create(entitat_id: @entitat.id, mesura: proposta_caldera.mesura_ca, descripcio: proposta_caldera.descripcio, cost_optimista: cost_optimista, cost_pessimista: cost_pessimista, estalvi_optimista: estalvi_optimista, estalvi_pessimista: estalvi_pessimista, data_any: data_any, data_mes: data_mes)
    
    redirect_to entitat_propostes_path(id: @entitat.id) 
  end

  def lletra_tipus_habitatge(entitat)
    if entitat.tipologia == "Unifamiliar"
      if entitat.any_construccio < 1951
        return 'a'
      elsif entitat.any_construccio > 1950 && entitat.any_construccio < 1981
        return 'b'
      elsif entitat.any_construccio > 1980 && entitat.any_construccio < 1991
        return 'c'
      elsif entitat.any_construccio > 1990 && entitat.any_construccio < 2012
        return 'd'
      else
        return 'z'
      end
    else
      if entitat.any_construccio < 1951
        return 'e'
      elsif entitat.any_construccio > 1950 && entitat.any_construccio < 1981
        return 'g'
      elsif entitat.any_construccio > 1980 && entitat.any_construccio < 1991
        return 'h'
      elsif entitat.any_construccio > 1990 && entitat.any_construccio < 2012
        return 'i'
      else
        return 'z'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposta
      @proposta = Proposta.find(params[:id])
    end

    def set_entitat
      @entitat = Entitat.find(params[:entitat_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposta_params
      params.require(:proposta).permit(:entitat_id, :ambit, :cost_optimista, :cost_pessimista, :estalvi_optimista, :estalvi_pessimista, :roi_optimista, :roi_pessimista, :emissions_optimista, :emissions_pessimista, :data, :mesura, :descripcio, :data_any, :data_mes)
    end
end
