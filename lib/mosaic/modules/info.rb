module Mosaic
  module Modules
    # Info page for Mosaic
    class Info < Mosaic::Module
      respond_to :get, "/__mosaic__/info"
      
      # Returns the contained view for the page
      def handle
        @response.layout = contained_view("info/layout.html.erb")
        @response.content = contained_view("info/index.html.erb")
      end
      
      # A hash of info used by the info page
      def info
        {
          root: File.expand_path("../../../../", __FILE__)
        }
      end
    end
  end
end