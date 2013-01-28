require 'fileutils'

module Mosaic
  module Stores
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
      
      def create_file_and_folder
        begin
          Dir::mkdir(@directory)
        rescue Errno::EEXIST
        end
        FileUtils.touch "#{@directory}/#{@store}.yml"
      end
      
      def save(hash)
        File.open("#{@directory}/#{@store}.yml", 'w+') {|f| f.write(hash.to_yaml) }
      end
    end
  end
end