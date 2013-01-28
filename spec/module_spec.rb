require 'spec_helper'

describe Mosaic::Module do
  it "should accept 2 inputs" do
    Mosaic::Module.new(DummyRequest.new, "foo/bar")
  end
end