require "warpaint/cli"

describe Warpaint::CLI do
  before (:each) do
    @args = ARGV.dup
  end

  it "should optionally write to an output file (with '-o path')" do
    ARGV = [ '-o', 'output.kml' ]

    cli = Warpaint::CLI.new
    cli.parse_options
    cli.config[:output_file].should == 'output.kml'
  end
  
  it "should optionally display usage info (with '-h or --help')" do
    ARGV = [ '-h' ]

    cli = Warpaint::CLI.new

    stdout = $stdout
    trapped_output = StringIO.new
    $stdout = trapped_output

    lambda { cli.parse_options }.should raise_error SystemExit
    trapped_output.string.should match /-o, --out OUTPUT\s+The output file \(\.KML\) to write/
    trapped_output.string.should match /-h, --help\s+Show this message/

    $stdout = stdout
  end
  
  after(:each) do
    ARGV = @args
  end
end