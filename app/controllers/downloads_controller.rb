class DownloadsController < ApplicationController

  def show 
    respond_to do |format|
      format.pdf { send_entitat_pdf }

      #if Rails.env.development?
      #  format.html { render_sample_html }
      #end
    end
  end

  private
 
  def generapdf
    #entitat = Entitat.find(params[:entitat_id])
    entitat = Entitat.find(1)
    DocumentPdf.new(entitat)
  end
 
  def send_entitat_pdf
    send_file generapdf.to_pdf,
      filename: generapdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end

  #def render_sample_html
  #  entitat = Entitat.find(params[:entitat_id])
  #  render template: "entitats/pdf2", layout: "pdf", locals: { entitat: entitat }
  #end
end