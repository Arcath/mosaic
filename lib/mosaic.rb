module Mosaic
  def self.set_root(path)
    @root = path
  end
  
  def self.root
    @root
  end
end

# Sinatra
require 'sinatra'
# Version
require "mosaic/version"
# Classes
require "mosaic/module"
require "mosaic/response"
# Required Modules
require "mosaic/modules/mosaic_layout"
# Stores
require "mosaic/stores/yaml"
