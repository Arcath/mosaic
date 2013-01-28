require 'sass/plugin/rack'

module Mosaic
	module Modules
    # Loads the SASS middleware and includes it in the middleware array
		class Sass < Mosaic::Module
      provide_middleware ::Sass::Plugin::Rack
		end
	end
end