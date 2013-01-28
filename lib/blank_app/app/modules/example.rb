class ExampleModule < Mosaic::Module
  respond_to :get, "/example"
  
  def handle
    @response.content = :'index.html'
  end
end