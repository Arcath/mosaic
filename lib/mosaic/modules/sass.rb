require 'sass/plugin/rack'

module Mosaic
	module Modules
		class Sass < Mosaic::Module
      provide_middleware ::Sass::Plugin::Rack
		end
	end
end