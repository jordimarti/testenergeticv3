class PropostesController < ApplicationController
  before_action :set_proposta, only: [:show, :edit, :update, :destroy]
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
      params.require(:proposta).permit(:entitat_id, :ambit, :cost_optimista, :cost_pessimista, :estalvi_optimista, :estalvi_pessimista, :roi_optimista, :roi_pessimista, :emissions_optimista, :emissions_pessimista, :data, :mesura, :descripcio)
    end
end
