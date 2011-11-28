require "warpaint/netxml"

describe Warpaint::NetXML do
  it "should parse the file into a given data stucture" do
    parser = Warpaint::NetXML.new('data/Kismet-20111124-01-56-22-1.netxml')
    struct = double()
    
    struct.should_receive(:add_wireless_network).with(:last_time => Time.parse("Thu Nov 24 02:58:59 2011"), :essid => "HackShack", :encryption => "None")
    struct.should_receive(:add_wireless_network).with(:last_time => Time.parse("Thu Nov 24 02:50:00 2011"), :essid => "Thunderdome", :encryption => "None")
    struct.should_receive(:add_wireless_network).with(:last_time => Time.parse("Thu Nov 24 02:07:45 2011"), :essid => "NewHackCity", :encryption => "None")

    parser.parse_into(struct)
  end
end