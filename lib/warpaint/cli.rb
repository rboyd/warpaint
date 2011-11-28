require "rubygems"
require "mixlib/cli"

module Warpaint
  class CLI
    include Mixlib::CLI

    option :output_file, 
      :short => "-o OUTPUT",
      :long  => "--out OUTPUT",
      :description => "The output file (.KML) to write"

    option :adjust_netxml_time,
      :short => "-nt NETXML_TIME_ADJUSTMENT",
      :long => "--ntime NETXML_TIME_ADJUSTMENT",
      :description => "Adjust the timestamps in NetXML file by seconds (can be negative)"

    option :adjust_gpx_time,
      :short => "-gt GPX_TIME_ADJUSTMENT",
      :long => "--gtime GPX_TIME_ADJUSTMENT",
      :description => "Adjust the timestamps in GPX file by seconds (can be negative)"

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