class EntitatsController < ApplicationController
  before_action :set_entitat, only: [:show, :edit, :update, :destroy, :ambits, :aixecament, :envolupant, :iluminacio, :clima, :propostes, :documents]
  before_action :authenticate_user!

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
    clima.tipologia_refrigeracio = 'no'
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
  end

  def clima
    @subnavigation = true
    @submenu_actiu = 'aixecament'
    @clima = Climatitzacio.where(entitat_id: @entitat.id).last
  end

  def propostes
    @subnavigation = true
    @submenu_actiu = 'propostes'
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
