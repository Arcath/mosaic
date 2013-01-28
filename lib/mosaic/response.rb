module Mosaic
  # Used to build a response for sinatra to serve
  class Response
    attr_accessor :content_type, :content, :layout, :response_code, :format
    attr_reader :request
    
    def initialize(request)
      @format = :erb
      @layout = :'layouts/application.html'
      @request = request
      @response_code = 200
      @content_type = "text/html"
    end
  end
end