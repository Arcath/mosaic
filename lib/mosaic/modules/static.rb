module Mosaic
  module Modules
    # Static view system.
    # Allows requests to be made for files in the views folder
    # Will always be at the bottom of the response list
    class Static < Mosaic::Module
      respond_to :get, '*'
      
      # Set the response file to the requested view
      def handle
        @response.content = file.to_sym
      end
      
      # Work out what view to serve
      def file
        "#{@request.path_info}.html".gsub(/\/\./, 'index.')
      end
    end
  end
end