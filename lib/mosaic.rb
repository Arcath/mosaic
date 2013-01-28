# Main Mosaic Module, all code is contained within this Module
module Mosaic
  
  # Sets the root path, used in the users application to set the root to the applications root
  def self.set_root(path)
    @root = path
  end
  
  # Returns the root path, used by Moasic::Application
  def self.root
    @root
  end
  
  # Data stores container
  module Stores
  end
end

# Sinatra
require 'sinatra'
# Version
require "mosaic/version"
# Classes
require "mosaic/module"
require "mosaic/response"
# Stores
require "mosaic/stores/yaml"
