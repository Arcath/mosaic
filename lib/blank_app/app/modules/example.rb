# Example Mosaic Module
#
# Would respond to /example with the contents of views/index.html
class ExampleModule < Mosaic::Module
  respond_to :get, "/example"
  
  # Is called by Mosaic when ever a request is made.
  def handle
    @response.content = :'index.html'
  end
end