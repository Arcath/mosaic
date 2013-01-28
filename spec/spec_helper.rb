require 'rubygems'
require "bundler"

Bundler.require

class TestModule < Mosaic::Module
  respond_to :get, "/"
end

class DummyRequest
  attr_reader :params
  
  def initilaize
    @params = {}
  end
end