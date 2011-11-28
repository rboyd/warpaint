require "warpaint/renderer"

describe Warpaint::Renderer do
  it "should integrate a collection of networks with a collection of track points and render a KML Placemark for each" do
    t1 = Time.parse("Thu Nov 24 02:58:59 2011")
    t2 = Time.parse("Thu Nov 24 02:50:00 2011")
    t3 = Time.parse("Thu Nov 24 02:07:45 2011")

    networks = double()
    networks.should_receive(:each).once.and_yield(t1, { :essid => "HackShack", :encryption => "None" }).
                                        and_yield(t2, { :essid => "Thunderdome", :encryption => "None" }).
                                        and_yield(t3, { :essid => "NewHackCity", :encryption => "None" })

    track_points = double()
    track_points.should_receive(:closest_to).with(t1).and_return([Time.parse("2011-11-23T20:54:29Z"), { :lat =>"38.97123336791992", :lon => "-92.31622314453125" }])
    track_points.should_receive(:closest_to).with(t2).and_return([Time.parse("2011-11-23T20:54:31Z"), { :lat =>"38.971229553222656", :lon => "-92.31654357910156" }])
    track_points.should_receive(:closest_to).with(t3).and_return([Time.parse("2011-11-23T20:54:30Z"), { :lat =>"38.971229553222656", :lon => "-92.31639099121094" }])


    renderer = Warpaint::Renderer.new(networks, track_points)
    buf = StringIO.new
    renderer.render_to(buf)

#    buf.string.should match //
  end
end