
# encoding: utf-8

class Podding < Sinatra::Base
  Less.paths << "#{settings.views}/css"

  get "/css/:file.css" do |file|
    path = "css/#{file}".to_sym
    logger.info "Loading #{path}"
    less path
  end

end

