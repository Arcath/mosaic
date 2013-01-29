require 'rubygems'
require "bundler"

Bundler.require

class TestModule < Mosaic::Module
  respond_to :get, "/"
  respond_to :get, "/foo/:bar"
end

class DummyRequest
  attr_reader :params, :path_info
  
  def initialize(path_info = "")
    @params = {}
    @path_info = path_info
  end
end