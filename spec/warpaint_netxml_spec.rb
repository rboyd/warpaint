require "warpaint/netxml"

describe Warpaint::NetXML do
  DUMMY_INPUT_FILE = "dummy_input.netxml"

  it "should take a path for an input file in its constructor" do
    input_file = File.open(DUMMY_INPUT_FILE, "w+") { |f| f.write "test" }
    lambda { Warpaint::NetXML.new(DUMMY_INPUT_FILE) }.should_not raise_error
    File.delete DUMMY_INPUT_FILE
  end
  
  it "should raise an error if no valid file is given" do
    lambda { Warpaint::NetXML.new(DUMMY_INPUT_FILE) }.should raise_error "File not found: dummy_input.netxml"
  end
  
  it "should parse the file into a given data stucture" do
    painter = Warpaint::NetXML.new('data/Kismet-20111124-01-56-22-1.netxml')
    struct = double()
    
    struct.should_receive(:add_wireless_network).with(:last_time=>"Thu Nov 24 02:58:59 2011", :essid=>"HackShack", :encryption=>"None")
    struct.should_receive(:add_wireless_network).with(:last_time=>"Thu Nov 24 02:50:00 2011", :essid=>"Thunderdome", :encryption=>"None")
    struct.should_receive(:add_wireless_network).with(:last_time=>"Thu Nov 24 02:07:45 2011", :essid=>"NewHackCity", :encryption=>"None")

    painter.parse_into(struct)
  end
end