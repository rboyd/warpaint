module Warpaint
  class Warpaint::Parser
    def initialize(input_file)
      raise "File not found: #{input_file}" unless File.exists? input_file
      @input_file = input_file
    end
  end
end