require 'spec_helper'
require 'mosaic/modules/info'

describe Mosaic::Modules::Info do
  it "should add a path" do
    Mosaic.responders["/__mosaic__/info"].should be_a Array
  end
end