module Mosaic
  module Modules
    class Static < Mosaic::Module
      respond_to :get, '*'
      
      def handle
        @response.content = file.to_sym
      end
      
      def file
        "#{@request.path_info}.html".gsub(/\/\./, 'index.')
      end
    end
  end
end