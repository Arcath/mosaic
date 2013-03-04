module Mosaic
  # Used to build a response for sinatra to serve
  class Response
    attr_accessor :content, :layout, :response_code, :view_format, :output_format
    attr_reader :request
    
    def initialize(request)
      @view_format = :erb
      @output_format = :html
      @layout = :'layouts/application'
      @request = request
      @response_code = 200
    end
  end
end