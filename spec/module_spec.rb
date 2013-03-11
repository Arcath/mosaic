require 'spec_helper'

describe Mosaic::Module do
  it "should accept 2 inputs" do
    Mosaic::Module.new(DummyRequest.new, "/foo/bar")
  end
  
  it "should put the path variable into params" do
    responder = TestModule.new(DummyRequest.new("/foo/widget"), "/foo/:bar")
    responder.params[:bar].should eq "widget"
  end
  
  it "should have a response" do
    TestModule.new(DummyRequest.new("/foo/widget"), "/foo/:bar").response.should be_a Mosaic::Response
  end
  
  it "should have set respond to" do
    # This should have been set when TestModule was declared
    Mosaic.responders["/"].should be_a Array
  end
  
  it "should allow you to use handle_statically" do
    test_module = TestModule.new(DummyRequest.new("/foo/widget"), "/foo/:bar")
    test_module.handle
    test_module.response.response_code.should eq 404
  end
end