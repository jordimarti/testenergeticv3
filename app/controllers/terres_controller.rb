class TerresController < ApplicationController
  before_action :set_terra, only: [:edit, :update, :destroy]
  before_action :set_entitat, only: [:edit, :update, :destroy]

  def new
    entitat = Entitat.find(params[:entitat_id])
    @terra = Terra.new
    @terra.entitat_id = entitat.id
    @terra.ambit = entitat.ambit
    @terra.nom = "Nou terra"
    @terra.save
    redirect_to edit_terra_path(@terra)
  end

  def edit
    @subnavigation = true
    @submenu_actiu = 'aixecament'
  end

  def update
    @terra.update(terra_params)
    #Calculem transmitància tèrmica segons Taula 3 DB-HE1 calculo parametros caracteristicos
    b = @terra.superficie / (@terra.longitud_perimetre * 0.5)
    case b
    when 0..10.49
      b = b.round
    when 10.5..12.99
      b = 12
    when 13..14.99
      b = 14
    when 15..16.99
      b = 16
    when 17..18.99
      b = 18
    else
      b = 20
    end
    
    case @terra.resistencia_termica_aillant
    when 0..0.75
      r = 0.5
    when 0.76..1.25
      r = 1
    when 1.26..1.75
      r = 1.5
    when 1.76..2.25
      r = 2
    else
      r = 2.5
    end

    case @terra.ample_aillament
    when 0..0.75
      d = 0.5
    when 0.76..1.25
      d = 1
    else
      d = 1.5
    end

    puts "Valors-----"
    puts b
    puts "--"
    puts r
    puts "--"
    puts d
    puts "--"
    transmitancia = TransmitanciaLlosa.where(longitud_perimetre: b, resistencia_termica_aillant: r, ample_aillament: d).last
    @terra.transmitancia_terra = transmitancia.valor
    @terra.save
    redirect_to entitat_envolupant_path(@entitat)
  end

  def destroy
    @terra.destroy
    redirect_to entitat_envolupant_path(@entitat)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_terra
      @terra = Terra.find(params[:id])
    end

    def set_entitat
      @entitat = Entitat.find(@terra.entitat_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def terra_params
      params.require(:terra).permit(:entitat_id, :ambit, :nom, :descripcio, :superficie, :percentatge, :transmitancia_terra, :profunditat, :resistencia_termica_aillant, :longitud_perimetre, :ample_aillament, :valor)
    end
end
