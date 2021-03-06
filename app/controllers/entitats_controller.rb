class EntitatsController < ApplicationController
  before_action :set_entitat, only: [:show, :edit, :update, :destroy, :ambits, :aixecament, :envolupant, :iluminacio, :clima, :aparells, :habits, :consums, :certificacio, :propostes, :documents, :generar_propostes]
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
      #Creem valors per defecte de consums
      consums_entitat(@entitat.id)
      #Creem valors per defecte de certificació energètica
      certificacio_entitat(@entitat.id)
      #Creem els valors per defecte de climatització
      if @entitat.ambit == 'subentitat' || @entitat.tipologia == 'unifamiliar'
        clima_entitat(@entitat.id, @entitat.ambit)
      else
        clima_zones_comunes(@entitat.id, @entitat.ambit)
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

  def consums_entitat(entitat_id)
    consum = ConsumGlobal.new
    consum.entitat_id = entitat_id
    consum.consum_anual_electricitat = 0
    consum.consum_anual_gas = 0
    consum.consum_anual_gasoil = 0
    consum.despesa_anual_electricitat = 0
    consum.despesa_anual_gas = 0
    consum.despesa_anual_gasoil = 0
    consum.save
  end

  def certificacio_entitat(entitat_id)
    certificacio = Certificacio.new
    certificacio.entitat_id = entitat_id
    certificacio.save
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

  def clima_zones_comunes(entitat_id, ambit)
    clima = Climatitzacio.new
    clima.entitat_id = entitat_id
    clima.ambit = ambit
    clima.tipologia_acs = 'no'
    clima.antiguitat_acs = 0
    clima.tipologia_calefaccio_1 = 'no'
    clima.antiguitat_calefaccio_1 = 0
    clima.tipologia_calefaccio_2 = 'no'
    clima.tipologia_refrigeracio = 'no'
    clima.antiguitat_refrigeracio = 0
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
    @forats_predefinits = ForatPredefinit.all
    @cobertes = Coberta.where(entitat_id: @entitat.id)
    @terres = Terra.where(entitat_id: @entitat.id)
    #Càlcul de la transmitància global
    transmitancia_murs = 0
    superficie_murs = 0
    @murs.each do |mur|
      if mur.superficie != nil
        transmitancia_murs = transmitancia_murs + (mur.superficie * mur.transmitancia_mur)
        superficie_murs = superficie_murs + mur.superficie
      end
    end
    transmitancia_forats = 0
    superficie_forats = 0
    @forats.each do |forat|
      transmitancia_forats = transmitancia_forats + (forat.superficie_total * forat.transmitancia_global_forat)
      superficie_forats = superficie_forats + forat.superficie_total
    end
    transmitancia_cobertes = 0
    superficie_cobertes = 0
    @cobertes.each do |coberta|
      transmitancia_cobertes = transmitancia_cobertes + (coberta.superficie * coberta.transmitancia_coberta)
      superficie_cobertes = superficie_cobertes + coberta.superficie
    end
    transmitancia_terres = 0
    superficie_terres = 0
    @terres.each do |terra|
      transmitancia_terres = transmitancia_terres + (terra.superficie * terra.transmitancia_terra)
      superficie_terres = superficie_terres + terra.superficie
    end
    if transmitancia_murs == 0 || transmitancia_forats == 0 || transmitancia_cobertes == 0 || transmitancia_terres == 0
      @transmitancia_entitat = "No es pot calcular"
    else
      @transmitancia_entitat = (transmitancia_murs + transmitancia_forats + transmitancia_cobertes + transmitancia_terres)/(superficie_murs + superficie_forats + superficie_cobertes + superficie_terres)
    end
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

  def aparells
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @aparells = Aparell.where(entitat_id: @entitat.id)
  end

  def habits
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @habits = Habit.where(entitat_id: @entitat.id)
  end

  def consums
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @consum_global = ConsumGlobal.find_by(entitat_id: @entitat.id)
  end

  def certificacio
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @certificacio = Certificacio.find_by(entitat_id: @entitat.id)
  end

  def propostes
    @subnavigation = true
    @submenu_actiu = 'propostes'
    @propostes = Proposta.where(entitat_id: @entitat.id)
    @consums_globals = ConsumGlobal.find_by(entitat_id: @entitat.id)
    @despesa_actual = Array.new
    @despesa_estalvi_optimista = Array.new
    @despesa_estalvi_pessimista = Array.new
    @estalvi_total_optimista = Array.new
    @any = Array.new
    despesa_acumulada = 0
    despesa_acumulada_optimista = 0
    despesa_acumulada_pessimista = 0
    increment_preu_electricitat = 2.5
    increment_preu_gas = 2.0
    # Els 15 anys de rang que hem definit
    for i in 0..14 do
      estalvi_total_optimista = 0
      estalvi_total_pessimista = 0
      data = Date.today.year + i 
      puts "Data actual"
      puts data
      @any[i] = data
      @propostes.each do |proposta|
        if proposta.data_any <= data
          estalvi_total_optimista += proposta.estalvi_optimista
          puts 'Nom proposta'
          puts proposta.mesura
          puts 'Data'
          puts data
          puts 'Estalvi total optimista:'
          puts estalvi_total_optimista
          estalvi_total_pessimista += proposta.estalvi_pessimista
          puts 'Estalvi total pessimista:'
          puts estalvi_total_pessimista
        end
      end

      despesa = @consums_globals.despesa_anual_electricitat * (1 + increment_preu_electricitat/100)**i + @consums_globals.despesa_anual_gas * (1 + increment_preu_gas/100)**i
      despesa_acumulada += despesa
      @despesa_actual[i] = despesa_acumulada

      despesa_optimista = despesa - despesa*(estalvi_total_optimista/100)
      despesa_acumulada_optimista += despesa_optimista
      @despesa_estalvi_optimista[i] = despesa_acumulada_optimista

      despesa_pessimista = despesa - despesa*(estalvi_total_pessimista/100)
      despesa_acumulada_pessimista += despesa_pessimista
      @despesa_estalvi_pessimista[i] = despesa_acumulada_pessimista
    end
  end

  def documents
    @subnavigation = true
    @submenu_actiu = 'documents'
  end

  def descarrega
    respond_to do |format|
      format.pdf do
        if params[:locale] == 'es'
          render pdf: "Test",
          template: "entitats/pdf_es.html.erb",
          layout: "pdf.html.erb",
          margin: {top: 20}
        else
          render pdf: "Test",
          template: "entitats/pdf.html.erb",
          layout: "pdf.html.erb",
          margin: {top: 20}
        end
      end
    end
  end

  def transmitancies
    respond_to do |format|
      format.pdf do
        if params[:locale] == 'es'
          render pdf: "Transmitancias",
          template: "entitats/pdf_transmitancies_es.html.erb",
          layout: "pdf.html.erb",
          margin: {top: 20}
        else
          render pdf: "Transmitancies",
          template: "entitats/pdf_transmitancies.html.erb",
          layout: "pdf.html.erb",
          margin: {top: 20}
        end
      end
      format.html do
        render :pdf_transmitancies
      end
    end
  end

  private
    
    def set_entitat
      @entitat = Entitat.find(params[:id])
    end

    def entitat_params
      params.require(:entitat).permit(:user_id, :ambit, :pare, :tipus_via, :nom_via, :numero_via, :bloc, :codi_postal, :poblacio, :provincia, :any_construccio, :superficie_util, :nom_propietari, :cognoms_propietari, :tipus_identificacio_propietari, :identificacio_propietari, :email_propietari, :telefon_propietari, :adreca_propietari, :codi_postal_propietari, :poblacio_propietari, :provincia_propietari, :descripcio, :destinacio, :quota, :nom, :altitud_municipi, :regim_juridic, :nom_representant, :cognoms_representant, :tipus_identificacio_representant, :identificacio_representant, :adreca_representant, :codi_postal_representant, :poblacio_representant, :provincia_representant, :telefon_representant, :email_representant, :nom_tecnic, :cognoms_tecnic, :tipus_identificacio_tecnic, :identificacio_tecnic, :titulacio_tecnic, :colegi_tecnic, :num_colegiat_tecnic, :adreca_tecnic, :codi_postal_tecnic, :poblacio_tecnic, :provincia_tecnic, :telefon_tecnic, :email_tecnic, :imatge_entitat, :tipologia)
    end
end
