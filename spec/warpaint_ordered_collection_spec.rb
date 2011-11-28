require "warpaint/ordered_collection"
require "time"

describe Warpaint::OrderedCollection do
  it "should return the key-value pair closest to the given key" do
    oc = Warpaint::OrderedCollection.new

    oc[Time.parse("2011-11-23T20:30:00Z")] = :first
    oc[Time.parse("2011-11-23T20:45:00Z")] = :second
    oc[Time.parse("2011-11-23T21:00:00Z")] = :last
    
    oc.closest_to(Time.parse("2011-11-23T20:00:00Z")).should == [Time.parse("2011-11-23T20:30:00Z"), :first]
    oc.closest_to(Time.parse("2011-11-23T20:37:29Z")).should == [Time.parse("2011-11-23T20:30:00Z"), :first]
    oc.closest_to(Time.parse("2011-11-23T20:37:31Z")).should == [Time.parse("2011-11-23T20:45:00Z"), :second]
  end
end