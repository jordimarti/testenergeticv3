require "render_anywhere"
 
class LampadaPdf
  include RenderAnywhere
 
  def initialize(lampada)
    puts "--** initialize lampada"
    @lampada = lampada
  end
 
  def to_pdf
    puts "--** to_pdf lampada"
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/lampada.pdf")
  end
 
  def filename
    "Lampada #{lampada.id}.pdf"
  end
 
  private
 
    attr_reader :lampada
 
    def as_html
      puts "--** as html lampada"
      render template: "lampades/pdf", layout: "lampada_pdf", locals: { lampada: lampada }
    end
end