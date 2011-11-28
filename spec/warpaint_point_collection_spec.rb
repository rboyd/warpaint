require "warpaint/point_collection"

describe Warpaint::PointCollection do
  it "should maintain sort order of track points by time (earliest first)" do
    pc = Warpaint::PointCollection.new
    
    pc.add_track_point(:time => Time.parse("2011-11-23T20:54:29Z"), :lat =>"38.97123336791992", :lon => "-92.31622314453125")
    pc.add_track_point(:time => Time.parse("2011-11-23T20:54:31Z"), :lat =>"38.971229553222656", :lon => "-92.31654357910156")
    pc.add_track_point(:time => Time.parse("2011-11-23T20:54:30Z"), :lat =>"38.971229553222656", :lon => "-92.31639099121094")

    pc.first.should == [Time.parse("2011-11-23T20:54:29Z"), { :lat =>"38.97123336791992", :lon => "-92.31622314453125" }]
    pc.last.should == [Time.parse("2011-11-23T20:54:31Z"), { :lat =>"38.971229553222656", :lon => "-92.31654357910156" }]
  end

  it "should optionally allow time adjustment in constructor" do
    pc = Warpaint::PointCollection.new(3600)
    time = Time.now
    pc.add_track_point(:time => time, :lat =>"38.97123336791992", :lon => "-92.31622314453125")
    pc.first.should == [time+3600, { :lat =>"38.97123336791992", :lon => "-92.31622314453125" }]
  end
end