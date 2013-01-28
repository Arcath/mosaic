require 'fileutils'

module Mosaic
  module Stores
    # Store data in yaml files
    class Yaml
      attr_reader :yaml
      
      def initialize(name)
        @store = name
        @directory = "#{Mosaic.root}/app/stores"
        begin
          @yaml = YAML::load(File.open("#{@directory}/#{@store}.yml"))
        rescue
          create_file_and_folder
          @yaml = YAML::load(File.open("#{@directory}/#{@store}.yml"))
        end
      end
      
      # Create the files and folders if they are missing
      def create_file_and_folder
        begin
          Dir::mkdir(@directory)
        rescue Errno::EEXIST
        end
        FileUtils.touch "#{@directory}/#{@store}.yml"
      end
      
      # Write the hash back to the yaml file
      def save(hash)
        File.open("#{@directory}/#{@store}.yml", 'w+') {|f| f.write(hash.to_yaml) }
      end
    end
  end
end