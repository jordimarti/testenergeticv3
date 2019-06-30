class EntitatsController < ApplicationController
  before_action :set_entitat, only: [:show, :edit, :update, :destroy, :ambits]

  def index
    @entitats = Entitat.where(user_id: current_user.id, ambit: "edifici").order(created_at: :desc)
  end

  def ambits
    @subnavigation = true
    @subentitat = false
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
      @subentitat = true
      @edifici = Entitat.find(@entitat.pare)
    else
      @subentitat = false
      @edifici = @entitat
    end
  end

  def create
    @entitat = Entitat.new(entitat_params)

    if @entitat.save
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
        redirect_to entitat_ambits_path(@entitat)
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

  def aixecament

  end

  private
    
    def set_entitat
      @entitat = Entitat.find(params[:id])
    end

    def entitat_params
      params.require(:entitat).permit(:user_id, :ambit, :pare, :tipus_via, :nom_via, :numero_via, :bloc, :codi_postal, :poblacio, :provincia, :any_construccio, :superficie_util, :nom_propietari, :cognoms_propietari, :tipus_identificacio_propietari, :identificacio_propietari, :email_propietari, :telefon_propietari, :adreca_propietari, :codi_postal_propietari, :poblacio_propietari, :provincia_propietari, :descripcio, :destinacio, :quota, :nom, :altitud_municipi, :regim_juridic, :nom_representant, :cognoms_representant, :tipus_identificacio_representant, :identificacio_representant, :adreca_representant, :codi_postal_representant, :poblacio_representant, :provincia_representant, :telefon_representant, :email_representant, :nom_tecnic, :cognoms_tecnic, :tipus_identificacio_tecnic, :identificacio_tecnic, :titulacio_tecnic, :colegi_tecnic, :num_colegiat_tecnic, :adreca_tecnic, :codi_postal_tecnic, :poblacio_tecnic, :provincia_tecnic, :telefon_tecnic, :email_tecnic, :imatge_entitat)
    end
end
