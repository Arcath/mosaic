module Mosaic
  def self.responders
    @responders || {}
  end
  
  def self.middleware
    @middleware || []
  end
  
  def self.add_response(type, path, mod)
    @responders ||= {}
    @responders[path] = [mod, type]
  end
  
  def self.add_middleware(middleware)
    @middleware ||= []
    @middleware.push(middleware)
  end
  
  class Module    
    def initialize(request, path)
      @request = request
      @response = Mosaic::Response.new(request)
      @params = request.params
      chunks = path.split("/").collect { |x| x if x =~ /:/ }
      chunks.each do |chunk|
        @params[chunk.gsub(/:/,'').to_sym] = @request.path_info.split("/")[path.split("/").index(chunk)] if chunk
      end
    end
    
    def self.respond_to(type, path)
      Mosaic.add_response(type, path, self)
    end
    
    def self.provide_middleware(middleware)
      Mosaic.add_middleware(middleware)
    end
    
    def self.responds_to
      self::RespondsTo
    end
    
    def response
      @response
    end
    
    private
    
    def contained_view(file)
      File.read(File.expand_path("../../../support/views/#{file}", __FILE__))
    end
  end
  
  module Modules
  end
end