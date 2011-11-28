require "warpaint/cli"

describe Warpaint::CLI do
  before (:each) do
    @args = ARGV.dup
  end

  # used to silence warnings when we redefine ARGV
  module Kernel
    def silence_warnings
      original_verbosity = $VERBOSE
      $VERBOSE = nil
      result = yield
      $VERBOSE = original_verbosity
      return result
    end
  end

  it "should optionally write to an output file (with '-o path')" do
    Kernel.silence_warnings do
      ARGV = [ '-o', 'output.kml' ]
    end

    cli = Warpaint::CLI.new
    cli.parse_options
    cli.config[:output_file].should == 'output.kml'
  end
  
  it "should optionally display usage info (with '-h or --help')" do
    Kernel.silence_warnings do
      ARGV = [ '-h' ]
    end

    cli = Warpaint::CLI.new

    stdout = $stdout
    trapped_output = StringIO.new
    $stdout = trapped_output

    lambda { cli.parse_options }.should raise_error SystemExit
    trapped_output.string.should match /-o, --out OUTPUT\s+The output file \(\.KML\) to write/
    trapped_output.string.should match /-h, --help\s+Show this message/

    $stdout = stdout
  end
  
  it "should optionally allow specification of time adjustment for network entries" do
    Kernel.silence_warnings do
      ARGV = [ '--ntime', '3600' ]
    end

    cli = Warpaint::CLI.new
    cli.parse_options
    cli.config[:adjust_netxml_time].should == "3600"
  end
  
  after(:each) do
    Kernel.silence_warnings do
      ARGV = @args
    end
  end
end