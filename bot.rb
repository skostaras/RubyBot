require 'yaml'
require_relative 'wordplay'

class Bot
  attr_reader :name
  def initialize(options)
    @name = options[:name] || "Unnamed bot"
    begin
      @data = YAML.load(File.read(options[:data_file]))
    rescue
      raise "Can't load bot data"
    end
  end

  def random_response(key)
    random_index = rand(@data[:responses][key].length)
    @data[:responses][key][random_index].gsub(/\[name\]/, @name)
  end

end