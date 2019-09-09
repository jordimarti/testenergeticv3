class DownloadsController < ApplicationController

  def show 
    respond_to do |format|
      format.pdf { send_entitat_pdf }

      if Rails.env.development?
        format.html { render_sample_html }
      end
    end
  end

  private
 
  def entitat_pdf
    entitat = Entitat.find(params[:entitat_id])
    DocumentPdf.new(entitat)
  end
 
  def send_entitat_pdf
    send_file entitat_pdf.to_pdf,
      filename: entitat_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end

  def render_sample_html
    entitat = Entitat.find(params[:entitat_id])
    render template: "entitats/pdf", layout: "pdf", locals: { entitat: entitat }
  end
end