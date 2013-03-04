require 'spec_helper'

describe Mosaic::Response do
  it "should assume some values" do
    response = Mosaic::Response.new(DummyRequest.new)
  end
  
  it "should use erb as the default view format" do
    response = Mosaic::Response.new(DummyRequest.new)
    response.view_format.should eq :erb
  end
end