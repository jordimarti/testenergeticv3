PDFKit.configure do |config|
	config.root_url = "#{Rails.root.join('public')}/"
  config.verbose = true
  config.default_options = {
     print_media_type: true,
     dpi: 400
  }
end