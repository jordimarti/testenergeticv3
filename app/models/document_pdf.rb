require "render_anywhere"

class DocumentPdf

	include RenderAnywhere
 
  def initialize(entitat)
    @entitat = entitat
  end
 
  def to_pdf
    #url_header = 'http://progrehab.herokuapp.com/edificis/pdf_header?locale=ca'
    #kit = PDFKit.new(as_html, header_html: url_header, page_size: 'A4')
    kit = PDFKit.new(as_html, page_size: 'A4', dpi: 400)
    kit.to_file("#{Rails.root}/public/testenergetic.pdf")
  end
 
  def filename
    "Test energetic #{entitat.id}.pdf"
  end
 
  private
 
    attr_reader :entitat
 
    def as_html
      render template: "entitats/pdf", layout: "pdf", locals: { entitat: entitat }
    end

end
