module Mosaic
  # The mosaic command class, used to create new applications
  class Bin
    def initialize(args)
      @args = args
      @root_path = File.expand_path("../../../", __FILE__)
      handle_arguments
    end
    
    private
    
    def handle_arguments
      if @args.include?("new")
        new_application
      else
        help_page
      end
    end
    
    def help_page
      puts "MOSAIC"
      puts "MOdular Sinatra ApplICation"
      puts ""
      puts "Usage:"
      puts "\tmosaic new [name]"
      puts "\t\tcreates a new mosaic application with the supplied name"
    end
    
    def new_application
      application_name = @args[@args.index("new") + 1]
      copy_command = "cp -r #{@root_path}/lib/blank_app ./#{application_name}"
      puts "Creating new application \"#{application_name}\""
      system(copy_command)
      system("mkdir -p ./#{application_name}/assets")
      system("mkdir -p ./#{application_name}/assets/css")
      system("mkdir -p ./#{application_name}/assets/js")
      system("mkdir -p ./#{application_name}/public")
      puts "Empty app copied!"
      puts "Running bundler"
      system("cd #{application_name}; bundle install")
      puts "Application Created!"
      puts "cd to #{application_name} to begin"
    end
  end
end