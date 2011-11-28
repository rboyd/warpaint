require "warpaint/network_collection"

describe Warpaint::NetworkCollection do
  it "should maintain sort order of networks by time (earliest first)" do
    nc = Warpaint::NetworkCollection.new
    
    nc.add_wireless_network(:last_time => Time.parse("Thu Nov 24 02:58:59 2011"), :essid => "HackShack", :encryption => "None")
    nc.add_wireless_network(:last_time => Time.parse("Thu Nov 24 02:50:00 2011"), :essid => "Thunderdome", :encryption => "None")
    nc.add_wireless_network(:last_time => Time.parse("Thu Nov 24 02:07:45 2011"), :essid => "NewHackCity", :encryption => "None")

    nc.first.should == [Time.parse("Thu Nov 24 02:07:45 2011"), { :essid => "NewHackCity", :encryption => "None" }]
    nc.last.should == [Time.parse("Thu Nov 24 02:58:59 2011"), { :essid => "HackShack", :encryption => "None" }]
  end
  
  it "should optionally allow time adjustment in constructor" do
    nc = Warpaint::NetworkCollection.new(3600)
    time = Time.now
    nc.add_wireless_network(:last_time => time, :essid => "HackShack", :encryption => "None")
    nc.first.should == [time+3600, { :essid => "HackShack", :encryption => "None" }]
  end
end