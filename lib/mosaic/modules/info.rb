module Mosaic
  module Modules
    class Info < Mosaic::Module
      respond_to :get, "/__mosaic__/info"
      
      def handle
        @response.layout = contained_view("info/layout.html.erb")
        @response.content = contained_view("info/index.html.erb")
      end
      
      def info
        {
          root: File.expand_path("../../../../", __FILE__)
        }
      end
    end
  end
end