module Mosaic
  # A hash of paths with response classes e.g.
  #    "/foo" => [FooHandler, :get]
  def self.responders
    @responders || {}
  end
  
  # An Array of middleware to be loaded by Mosaic::Application
  def self.middleware
    @middleware || []
  end
  
  # Adds a responder to the hash
  def self.add_response(type, path, mod)
    @responders ||= {}
    @responders[path] = [mod, type]
  end
  
  # Adds a piece middleware to the array
  def self.add_middleware(middleware)
    @middleware ||= []
    @middleware.push(middleware)
  end
  
  # The master class for all modules
  # Should be inhertied by any class that gets used in Mosaic::Aplication
  class Module
    # Creates a new responder, called by Mosaic::Application for every request that uses a given module
    # Takes the request object and the current path as input
    def initialize(request, path)
      @request = request
      @response = Mosaic::Response.new(request)
      @params = request.params
      chunks = path.split("/").collect { |x| x if x =~ /:/ }
      chunks.each do |chunk|
        @params[chunk.gsub(/:/,'').to_sym] = @request.path_info.split("/")[path.split("/").index(chunk)] if chunk
      end
    end
    
    # Class method for modules, if called the responder is declaring that it is capable of handling requests of the supplied type for the supplied path
    # Called as:
    #    respond_to :get, "/foo"
    def self.respond_to(type, path)
      Mosaic.add_response(type, path, self)
    end
    
    # Class method for modules, adds the supplied class to the middleware array
    # Called as:
    #    provide_middleware Foo:Middleware
    def self.provide_middleware(middleware)
      Mosaic.add_middleware(middleware)
    end
    
    # Returns the Moasic::Response object for use in the views
    def response
      @response
    end
    
    # Returns the request object for use in the views
    def request
      @request
    end
    
    private
    
    def contained_view(file)
      File.read(File.expand_path("../../../support/views/#{file}", __FILE__))
    end
  end
  
  # Container for modules supplied with Mosaic
  module Modules
  end
end