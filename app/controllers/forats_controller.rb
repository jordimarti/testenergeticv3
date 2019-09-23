class ForatsController < ApplicationController
  before_action :set_forat, only: [:edit, :update, :destroy]
  before_action :set_entitat, only: [:edit, :update, :destroy]

  def new
    entitat = Entitat.find(params[:entitat_id])
    @forat = Forat.new
    @forat.entitat_id = entitat.id
    @forat.ambit = entitat.ambit
    @forat.nom = "Nou forat"
    @forat.save
    redirect_to edit_forat_path(@forat)
  end

  def edit
    @subnavigation = true
    @submenu_actiu = 'aixecament'
  end

  def update
    @forat.update(forat_params)  
    @forat.transmitancia_global_forat = (@forat.superficie_transparent * @forat.transmitancia_transparent + @forat.superficie_marc * @forat.transmitancia_marc + @forat.longitud_contacte_marc_vidre * transmitancia_linial_acoplament(@forat.tipus_marc, @forat.tipus_vidre))/(@forat.superficie_marc + @forat.superficie_transparent)
    @forat.save
    redirect_to entitat_envolupant_path(@entitat)
  end

  def destroy
    @forat.destroy
    redirect_to entitat_envolupant_path(@entitat)
  end

  def transmitancia_linial_acoplament(tipus_marc, tipus_vidre)
    if tipus_marc == 'fusta' && tipus_vidre == 'senzill'
      return 0
    elsif tipus_marc == 'fusta' && tipus_vidre == 'doble'
      return 0.06
    elsif tipus_marc == 'fusta' && tipus_vidre == 'doble baix emissiu'
      return 0.08
    elsif tipus_marc == 'fusta' && tipus_vidre == 'triple'
      return 0.05
    elsif tipus_marc == 'fusta' && tipus_vidre == 'triple baix emissiu'
      return 0.06
    elsif tipus_marc == 'pvc' && tipus_vidre == 'senzill'
      return 0
    elsif tipus_marc == 'pvc' && tipus_vidre == 'doble'
      return 0.06
    elsif tipus_marc == 'pvc' && tipus_vidre == 'doble baix emissiu'
      return 0.08
    elsif tipus_marc == 'pvc' && tipus_vidre == 'triple'
      return 0.05
    elsif tipus_marc == 'pvc' && tipus_vidre == 'triple baix emissiu'
      return 0.06
    elsif tipus_marc == 'metalic rpt' && tipus_vidre == 'senzill'
      return 0
    elsif tipus_marc == 'metalic rpt' && tipus_vidre == 'doble'
      return 0.08
    elsif tipus_marc == 'metalic rpt' && tipus_vidre == 'doble baix emissiu'
      return 0.11
    elsif tipus_marc == 'metalic rpt' && tipus_vidre == 'triple'
      return 0.06
    elsif tipus_marc == 'metalic rpt' && tipus_vidre == 'triple baix emissiu'
      return 0.08
    elsif tipus_marc == 'metalic' && tipus_vidre == 'senzill'
      return 0
    elsif tipus_marc == 'metalic' && tipus_vidre == 'doble'
      return 0.02
    elsif tipus_marc == 'metalic' && tipus_vidre == 'doble baix emissiu'
      return 0.05
    elsif tipus_marc == 'metalic' && tipus_vidre == 'triple'
      return 0.01
    elsif tipus_marc == 'metalic' && tipus_vidre == 'triple baix emissiu'
      return 0.04
    end
  end

  private
    def set_forat
      @forat = Forat.find(params[:id])
    end

    def set_entitat
      @entitat = Entitat.find(@forat.entitat_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forat_params
      params.require(:forat).permit(:entitat_id, :ambit, :nom, :descripcio, :superficie_total, :superficie_opaca, :superficie_transparent, :superficie_marc, :transmitancia_opaca, :transmitancia_transparent, :transmitancia_marc, :longitud_contacte_marc_vidre, :longitud_contacte_marc_opac, :transmitancia_linial_marc_vidre, :transmitancia_linial_marc_opac, :numero, :percentatge, :tipus_marc, :tipus_vidre, :transmitancia_global_forat)
    end
end
