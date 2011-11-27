require "rubygems"
require "mixlib/cli"

module Warpaint
  class CLI
    include Mixlib::CLI

    option :output_file, 
      :short => "-o OUTPUT",
      :long  => "--out OUTPUT",
      :description => "The output file (.KML) to write"

    option :help,
      :short => "-h",
      :long => "--help",
      :description => "Show this message",
      :on => :tail,
      :boolean => true,
      :show_options => true,
      :exit => 0
  end
end