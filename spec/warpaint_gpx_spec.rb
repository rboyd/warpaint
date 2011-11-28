require "warpaint/gpx"

describe Warpaint::GPX do
  it "should parse a GPS eXchange Format (.GPX) file into a given data stucture" do
    parser = Warpaint::GPX.new('spec/data/2011-11-23 21-06-20.gpx')
    struct = double()

    struct.should_receive(:add_track_point).with(:time => Time.parse("2011-11-23T20:54:29Z"), :lat =>"38.97123336791992", :lon => "-92.31622314453125")
    struct.should_receive(:add_track_point).with(:time => Time.parse("2011-11-23T20:54:30Z"), :lat =>"38.971229553222656", :lon => "-92.31639099121094")
    struct.should_receive(:add_track_point).with(:time => Time.parse("2011-11-23T20:54:31Z"), :lat =>"38.971229553222656", :lon => "-92.31654357910156")
    struct.stub!(:add_track_point)

    parser.parse_into(struct)
  end
end