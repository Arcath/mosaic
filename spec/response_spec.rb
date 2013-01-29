require 'spec_helper'

describe Mosaic::Response do
  it "should assume some values" do
    response = Mosaic::Response.new(DummyRequest.new)
  end
end