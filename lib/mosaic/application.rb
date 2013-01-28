module Mosaic
  class Application < Sinatra::Base
    set :sessions, true
    set :root, Mosaic.root if Mosaic.root
    
    register Sinatra::StaticAssets
    
    puts "Middleware load order:"
    
    Mosaic.middleware.each do |middleware|
      puts middleware.inspect
      use middleware
    end
    
    puts "Route load order:"
    
    Mosaic.responders.keys.sort.reverse.each do |key|
      puts key
      self.send(Mosaic.responders[key][1], key) do
        @responder = Mosaic.responders[key][0].new(request, key)
        @responder.handle
        @params = request.params
        self.send(@responder.response.format, @responder.response.content, :layout => @responder.response.layout)
      end
    end
  end
end