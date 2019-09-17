class EntitatsController < ApplicationController
  before_action :set_entitat, only: [:show, :edit, :update, :destroy, :ambits, :aixecament, :envolupant, :iluminacio, :clima, :propostes, :documents, :generar_propostes]
  before_action :authenticate_user!
  respond_to :html, :js

  def index
    @entitats = Entitat.where(user_id: current_user.id, ambit: "edifici").order(created_at: :desc)
  end

  def ambits
    @subnavigation = true
    @submenu_actiu = 'ambits'
    @subentitats = Entitat.where(pare: @entitat.id).order(:nom)
  end

  def new
    @entitat = Entitat.new
  end

  def edit
    @subnavigation = true
    @submenu_actiu = 'identificacio'
    if @entitat.ambit == 'subentitat'
      @edifici = Entitat.find(@entitat.pare)
    else
      @edifici = @entitat
    end
  end

  def create
    @entitat = Entitat.new(entitat_params)

    if @entitat.save
      #Creem els valors per defecte de climatització si procedeix
      if @entitat.ambit == 'subentitat' || @entitat.tipologia == 'unifamiliar'
        clima_entitat(@entitat.id, @entitat.ambit)
      end

      if @entitat.ambit == 'subentitat'
        redirect_to entitat_ambits_path(@entitat.pare)
      else
        redirect_to entitats_path
      end
    else 
      render :new
    end
  end

  def update
    if @entitat.update(entitat_params)
      if @entitat.ambit == 'subentitat'
        redirect_to entitat_ambits_path(@entitat.pare)
      else
        redirect_to edit_entitat_path(@entitat)
      end
    else 
      render :edit
    end
  end

  def destroy
    @entitat.destroy
    respond_to do |format|
      format.html { redirect_to entitats_url, notice: 'Entitat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def clima_entitat(entitat_id, ambit)
    clima = Climatitzacio.new
    clima.entitat_id = entitat_id
    clima.ambit = ambit
    clima.tipologia_acs = 'caldera_mixta_gas'
    clima.antiguitat_acs = 8
    clima.tipologia_calefaccio_1 = 'caldera_mixta_gas'
    clima.antiguitat_calefaccio_1 = 8
    clima.tipologia_calefaccio_2 = 'no'
    clima.tipologia_refrigeracio = 'aire_condicionat'
    clima.antiguitat_refrigeracio = 5
    clima.generacio = 'no'
    clima.save
  end

  def aixecament
    @subnavigation = true
    @submenu_actiu = 'aixecament'
  end

  def envolupant
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @murs = Mur.where(entitat_id: @entitat.id)
    @forats = Forat.where(entitat_id: @entitat.id)
    @cobertes = Coberta.where(entitat_id: @entitat.id)
  end

  def iluminacio
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @fluorescents_compactes = Lampada.where(tipologia: 'fluorescent_compacte', entitat_id: @entitat.id)
    @leds = Lampada.where(tipologia: 'led', entitat_id: @entitat.id)
    @fluorescents = Lampada.where(tipologia: 'fluorescent', entitat_id: @entitat.id)
    @halogenes = Lampada.where(tipologia: 'halogena', entitat_id: @entitat.id)
    @incandescents = Lampada.where(tipologia: 'incandescent', entitat_id: @entitat.id)
  end

  def clima
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @clima = Climatitzacio.where(entitat_id: @entitat.id).last
  end

  def propostes
    @subnavigation = true
    @submenu_actiu = 'propostes'
    @propostes = Proposta.where(entitat_id: @entitat.id)
    @consums_globals = ConsumGlobal.find_by(entitat_id: @entitat.id)
    @despesa_actual = Array.new
    @despesa_estalvi_optimista = Array.new
    @despesa_estalvi_pessimista = Array.new
    # Els 15 anys de rang que hem definit
    for i in 0..14 do
      estalvi_total_optimista = 0
      estalvi_total_pessimista = 0
      data = Date.today.year + i 
      @propostes.each do |proposta|
        if proposta.data_any < data
          estalvi_total_optimista += proposta.estalvi_optimista
          puts 'Estalvi total optimista:'
          puts estalvi_total_optimista
          estalvi_total_pessimista += proposta.estalvi_pessimista
          puts 'Estalvi total pessimista:'
          puts estalvi_total_pessimista
        end
      end

      @despesa_actual[i] = @consums_globals.despesa_anual_electricitat * (i+1) * (1.025**(i+1)) + @consums_globals.despesa_anual_gas * (i+1) * (1.02**(i+1))
      @despesa_estalvi_optimista[i] = @despesa_actual[i] - (@despesa_actual[i] * (estalvi_total_optimista/100))
      @despesa_estalvi_pessimista[i] = @despesa_actual[i] - (@despesa_actual[i] * (estalvi_total_pessimista/100))
      
    end
  end

  def pdf
    @propostes = Proposta.where(entitat_id: @entitat.id)
    @consums_globals = ConsumGlobal.find_by(entitat_id: @entitat.id)
    @despesa_actual = Array.new
    @despesa_estalvi_optimista = Array.new
    @despesa_estalvi_pessimista = Array.new
    # Els 15 anys de rang que hem definit
    for i in 0..14 do
      estalvi_total_optimista = 0
      estalvi_total_pessimista = 0
      data = Date.today.year + i 
      @propostes.each do |proposta|
        if proposta.data_any < data
          estalvi_total_optimista += proposta.estalvi_optimista
          puts 'Estalvi total optimista:'
          puts estalvi_total_optimista
          estalvi_total_pessimista += proposta.estalvi_pessimista
          puts 'Estalvi total pessimista:'
          puts estalvi_total_pessimista
        end
      end

      @despesa_actual[i] = @consums_globals.despesa_anual_electricitat * (i+1) * (1.025**(i+1)) + @consums_globals.despesa_anual_gas * (i+1) * (1.02**(i+1))
      @despesa_estalvi_optimista[i] = @despesa_actual[i] - (@despesa_actual[i] * (estalvi_total_optimista/100))
      @despesa_estalvi_pessimista[i] = @despesa_actual[i] - (@despesa_actual[i] * (estalvi_total_pessimista/100))
      
    end
  end

  

  def documents
    @subnavigation = true
    @submenu_actiu = 'documents'
  end

  private
    
    def set_entitat
      @entitat = Entitat.find(params[:id])
    end

    def entitat_params
      params.require(:entitat).permit(:user_id, :ambit, :pare, :tipus_via, :nom_via, :numero_via, :bloc, :codi_postal, :poblacio, :provincia, :any_construccio, :superficie_util, :nom_propietari, :cognoms_propietari, :tipus_identificacio_propietari, :identificacio_propietari, :email_propietari, :telefon_propietari, :adreca_propietari, :codi_postal_propietari, :poblacio_propietari, :provincia_propietari, :descripcio, :destinacio, :quota, :nom, :altitud_municipi, :regim_juridic, :nom_representant, :cognoms_representant, :tipus_identificacio_representant, :identificacio_representant, :adreca_representant, :codi_postal_representant, :poblacio_representant, :provincia_representant, :telefon_representant, :email_representant, :nom_tecnic, :cognoms_tecnic, :tipus_identificacio_tecnic, :identificacio_tecnic, :titulacio_tecnic, :colegi_tecnic, :num_colegiat_tecnic, :adreca_tecnic, :codi_postal_tecnic, :poblacio_tecnic, :provincia_tecnic, :telefon_tecnic, :email_tecnic, :imatge_entitat, :tipologia)
    end
end
