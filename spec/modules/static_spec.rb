require 'spec_helper'

describe Mosaic::Modules::Static do
  it "should use inde.html.erb for /" do
    mod = Mosaic::Modules::Static.new(DummyRequest.new("/"), "*")
    mod.handle
    mod.response.content.should eq :'index.html'
  end
  
  it "should return 404 for files that dont exist" do
    mod = Mosaic::Modules::Static.new(DummyRequest.new("/foo/bar"), "*")
    mod.handle
    mod.response.response_code.should eq 404
  end
end