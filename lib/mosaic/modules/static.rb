module Mosaic
  # Return the inbuilt 404 page
  def self.error404
    File.read(File.expand_path("../../../../support/views/errors/error404.html.erb", __FILE__))
  end
  
  module Modules
    # Static view system.
    # Allows requests to be made for files in the views folder
    # Will always be at the bottom of the response list
    class Static < Mosaic::Module
      respond_to :get, '*'
      
      # Set the response file to the requested view
      def handle
        @response.response_code = response_code
        @response.content = view
        @response.layout = set_layout
      end
      
      # Work out what view to serve
      def file
        "#{@request.path_info}.html".gsub(/\/\./, 'index.')
      end
      
      # Return the 404 view if needed
      def view
        response_code == 200 ? file.to_sym : Mosaic.error404
      end
      
      # Use no layout for 404
      def set_layout
        response_code == 200 ? :'layouts/application.html' : nil
      end
      
      # Work out the response code
      def response_code
        File.exists?("views/#{file}.erb") ? 200 : 404
      end
    end
  end
end