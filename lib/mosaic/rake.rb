task :default do
  puts "List rake tasks with `rake -T`"
end

namespace :mosaic do
  desc "List all the paths and which module responds to it"
  task :paths do
    Mosaic.responders.each do |path, mod|
      puts "#{mod.last} -> #{path} -> #{mod.first}"
    end
  end
  
  desc "Lists all the modules"
  task :modules do
    modules = []
    Mosaic.responders.each do |path, mod|
      modules.push mod.first unless modules.include? mod.first
    end
    modules.each do |mod|
      puts mod
    end
  end
  
  desc "Lists all the middleware"
  task :middleware do
    Mosaic.middleware.each do |middleware|
      puts middleware
    end
  end
end