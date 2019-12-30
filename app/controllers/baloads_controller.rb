class BaloadsController < ApplicationController
 
  def show
    respond_to do |format|
      puts "--** show baloads controller"
      format.pdf { send_lampada_pdf }
    end
  end
 
  private
 
  def lampada_genera_pdf
    puts "--** lampada_genera_pdf"
    lampada = Lampada.find(params[:lampada_id])
    LampadaPdf.new(lampada)
  end
 
  def send_lampada_pdf
    send_file lampada_genera_pdf.to_pdf,
      filename: lampada_genera_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end
end