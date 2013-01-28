module Mosaic
  module Modules
    class MosaicLayout < Mosaic::Module
      respond_to :get, "/__mosaic__/:file"
      
      def handle
        raise "working"
      end
    end
  end
end